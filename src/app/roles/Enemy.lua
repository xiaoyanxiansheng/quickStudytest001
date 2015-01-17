local Progress = import("..commonui.Progress")
local Enemy = class("Enemy1",function()
	return display.newSprite("#enemy1-1-1.png")
end)

function Enemy:ctor()
    self:addBloodBar()
    self:addGangti();
end
function Enemy:addBloodBar()
    local size = self:getContentSize()
    self.progress = Progress.new("#small-enemy-progress-bg.png", "#small-enemy-progress-fill.png")
    self.progress:setPosition(size.width*2/3, size.height + self.progress:getContentSize().height/2)
    self:addChild(self.progress)
end
function Enemy:addGangti()
    local playerBody = cc.PhysicsBody:createBox(cc.size(self:getContentSize().width/3,self:getContentSize().height),cc.PhysicsMaterial(1,1,0.5),{100,100})
    playerBody:setMass(0);
    self:setPhysicsBody(playerBody)
end
return Enemy
