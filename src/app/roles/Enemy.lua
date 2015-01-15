local Progress = import("..commonui.Progress")
local Enemy = class("Enemy1",function()
	return display.newSprite("#enemy1-1-1.png")
end)

function Enemy:ctor()
    self:addBloodBar()
end
function Enemy:addBloodBar()
    local size = self:getContentSize()
    self.progress = Progress.new("#small-enemy-progress-bg.png", "#small-enemy-progress-fill.png")
    self.progress:setPosition(size.width*2/3, size.height + self.progress:getContentSize().height/2)
    self:addChild(self.progress)
end
return Enemy
