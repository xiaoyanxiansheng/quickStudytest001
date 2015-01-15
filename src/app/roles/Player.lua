local Progress = import("..commonui.Progress")
local Player = class("Player",function()
    local sprite = display.newSprite("#player1-1-1.png")
    return sprite;
end)
function Player:ctor()
    -- 添加状态机
    self:addStatusMachine()
    -- 添加血量条
    self:addBloodBar()
end
function Player:addAnimation()
    local animationNames = {"walk", "attack", "dead"}
    local animationFrameNum = {4, 4, 4}

    for i = 1, #animationNames do
        local frames = display.newFrames("player1-" .. i .. "-%d.png", 1, animationFrameNum[i])
        local animation = display.newAnimation(frames, 0.2)
        display.setAnimationCache("player1-" .. animationNames[i], animation)
    end
end
function Player:walkTo(pos, callback)
    local function moveStop()
        transition.stopTarget(self)
        if callback then
            callback()
        end
    end
    local time = 4*self.ppDistance(pos,cc.p(self:getPositionX(),self:getPositionY()))/display.width
    --运行，运行完成后调用moveStop函数
    local seq = transition.sequence({cc.MoveTo:create(time, pos), cc.CallFunc:create(moveStop)})
    --运行一个动作
    self:runAction(seq)
    --运行动画
    transition.playAnimationForever(self, display.getAnimationCache("player1-walk"))
    return true
end
function Player:attack()
    transition.playAnimationOnce(self, display.getAnimationCache("player1-attack"))
end
function Player:dead()
    transition.playAnimationOnce(self, display.getAnimationCache("player1-dead"))
end
function Player.ppDistance(pos1,pos2)
    local x = pos1.x-pos2.x
    local y = pos1.y-pos2.y
    return math.sqrt(x*x+y*y)
end
function Player:addStatusMachine()
    --创建状态组件
    self.fsm  = {}
    cc.GameObject.extend(self.fsm):addComponent("components.behavior.StateMachine"):exportMethods()
    --设置状态机
    self.fsm : setupState({
        -- 初始状态
        initial = "idle",
        -- 事件和状态转换
        events = {
            {name = "clickScreen",from={"idle", "attack"},to = "walk" },
            {name = "clickEnemy",  from = {"idle", "walk"},  to = "attack"},
            {name = "beKilled", from = {"idle", "walk", "attack"},  to = "dead"},
            {name = "stop", from = {"walk", "attack"}, to = "idle"},
        },
        -- 回调函数
        callbacks = {
            onidle = function () print("idle") end,
            onwalk = function () print("move") end,
            onattack = function () print("attack") end,
            ondead = function () print("dead") end
        },
    })
end
function Player:doEvent(event)
    self.fsm:doEvent(event)
end
function Player:addBloodBar(progress)
    self.progress = progress
end
return Player