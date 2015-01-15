local Progress = class("Progress",function(background,fill)
    local progress = display.newSprite(background)
    local fill = display.newProgressTimer(fill,display.PROGRESS_TIMER_BAR)
    --设置进度条起点
    fill:setMidpoint(cc.p(0,0.5))
    --设置改变状态
    fill:setBarChangeRate(cc.p(1.0, 0))
    --
    fill:setPosition(progress:getContentSize().width/2,progress:getContentSize().height/2)
    progress:addChild(fill)
    fill:setPercentage(100)
    
    return progress
end)
function Progress:ctor()end
--function Progress:setProgress(progress)
--    self.fill:setPercentage(progress)
--end

return Progress