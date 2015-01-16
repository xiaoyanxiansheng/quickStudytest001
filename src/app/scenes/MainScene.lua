local Player = import("..roles.Player")
local Enemy = import("..roles.Enemy")
local Progress = import("..commonui.Progress")
local PaushLayer = import("..views.PaushLayer")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    --加入缓存动画
    Player:addAnimation();

    --加入背景
    local background = display.newSprite("image/background.png",display.cx,display.cy)
    self:addChild(background)
    
    --加入猪脚
    self.player = Player.new()
    self.player:setPosition(display.left + self.player:getContentSize().width/2, display.cy)
    self:addChild(self.player)
    --加入玩家血条
    self:addPlayerBloodBar()
    
    --加入敌人
    self.enemy = Enemy.new()
    self.enemy:setPosition(display.right - self.enemy:getContentSize().width/2, display.cy)
    self:addChild(self.enemy)    
    
    --加入触屏事件
    self:addTouchLayer()
    
    --加入暂停按钮
    self:addStopButton()
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

function MainScene:addTouchLayer()
    local function onTouch(eventName,x,y)
        if eventName == "began" then
            self.player:walkTo(cc.p(x,y))
            index = index or 1  -- 取事件字符串的索引
            
            local fsmEvents = {"clickScreen", "clickEnemy", "beKilled", "stop"}
            self.player:doEvent(fsmEvents[index])
            index = index + 1
        end
    end
    --new一个可接受点击的节点
    self.layerTouch = display.newLayer()
    --给节点添加点击回调函数
    self.layerTouch:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return onTouch(event.name, event.x, event.y)
    end)
    --将此节点加入到游戏中
    self:addChild(self.layerTouch)
end
function MainScene:addPlayerBloodBar()
    self.progress = Progress.new("#player-progress-bg.png", "#player-progress-fill.png")
    self.progress:setPosition(display.left + self.progress:getContentSize().width/2, display.top - self.progress:getContentSize().height/2)
    self:addChild(self.progress)
    --将血条权限给玩家
    self.player:addBloodBar(self.progress);
end
function MainScene:addStopButton()
    self.stopButton = cc.ui.UIPushButton.new({normal = "#pause1.png",pressed = "#pause2.png"})
    self.stopButton:setPosition(display.right-50, display.top-50)
    self.stopButton:onButtonClicked(function()
        self:paush()
    end)
    self:addChild(self.stopButton)
end
function MainScene:paush()
    --暂停界面
    display.pause()
    --显示暂停界面
    local paushLayer = PaushLayer.new()
    self:addChild(paushLayer)
end
return MainScene
