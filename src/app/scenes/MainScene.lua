local Player = import("..roles.Player")
local Enemy = import("..roles.Enemy")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
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
end

function MainScene:onEnter()
end

function MainScene:onExit()
end


return MainScene
