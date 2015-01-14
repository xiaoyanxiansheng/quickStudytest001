local Player = class("Player",function()
    local sprite = display.newSprite("#player1-1-1.png")
    return sprite;
end)
function Player:ctor()
    
end

function Player:addAnimation()
    local animationNames = {"walk","attack","dead"}
    local animationFrameNum = {4,4,4}
    
    for i = 1,#animationNames do
        local frames = display.newFrames("player1-" .. i .. "-%d.png", 1, animationFrameNum[i])
        local animation = display.newAnimation(Frames,0.2)
        display.setAnimationCache("player1-" .. animationNames[i], animation)
    end
end

function Player:attack()
    transition.playAnimationOnce(self, display.getAnimationCache("player1-attack"))
end
return Player