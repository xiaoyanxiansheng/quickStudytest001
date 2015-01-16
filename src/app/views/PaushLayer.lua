local PaushLayer = class("PaushLayer",function()
    return display.newColorLayer(cc.c4b(162,162,162,168))
end)

function PaushLayer:ctor()
    self:addUI()
    self:addTouch()
end
function PaushLayer:addUI()
    local background = display.newSprite("#pause-bg.png")
    background:setPosition(display.cx, display.cy)
    self:addChild(background)
    --回主界面按钮
    self.homeButton = cc.ui.UIPushButton.new({normal = "#home-1.png",pressed = "#home-2.png"})
    self.homeButton:onButtonClicked(function()
        self:goHome()
    end)
    local backgroundSize = background:getContentSize()
    self.homeButton:setPosition(backgroundSize.width/3, backgroundSize.height/2)
    background:addChild(self.homeButton)
    --回到游戏
    self.resumeButton = cc.ui.UIPushButton.new({normal ="#continue-1.png",pressed="#continue-2.png"})
    self.resumeButton:onButtonClicked(function()
        self:resume()
    end)
    self.resumeButton:setPosition(backgroundSize.width*2/3, backgroundSize.height/2)
    background:addChild(self.resumeButton)
end

function PaushLayer:addTouch()
    local function onTouch(name, x, y)

    end

    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return onTouch(event.name, event.x, event.y)
    end)

    self:setTouchEnabled(true)
end

function PaushLayer:goHome()end
function PaushLayer:resume()
    --移除暂停界面
    self:removeFromParent(true)
    local sprite = display.newSprite()
    --返回游戏
    display.resume()
end
return PaushLayer