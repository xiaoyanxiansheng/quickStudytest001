local Player = import("..roles.Player")
local Enemy = import("..roles.Enemy")
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
    
    --加入敌人
    self.enemy = Enemy.new()
    self.enemy:setPosition(display.right - self.enemy:getContentSize().width/2, display.cy)
    self:addChild(self.enemy)
    
    --加入触屏事件
    self:addTouchLayer()
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

function MainScene:addTouchLayer()
    local function onTouch(eventName,x,y)
        if eventName == "began" then
            Player:attack()
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

return MainScene
