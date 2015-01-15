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

    local homeButton = cc.ui.UIPushButton.new({normal = "#home-1.png",pressed = "#home-2.png"})
--    homeButton.onButtonClicked(function()
--        self:goHome()
--    end)
    local homeButtonSize = homeButton:getContentSize()
    --homeButton:setPosition(homeButtonSize.width/3, homeButtonSize.height/2)
    background:addChild(homeButton)
--    local home = ui.newImageMenuItem({
--        image = "#home-1.png",
--        imageSelected = "#home-2.png",
--        listener = function()
--            self:home()
--        end
--    })
--
--    local resume = ui.newImageMenuItem({
--        image = "#continue-1.png",
--        imageSelected = "#continue-2.png",
--        listener = function()
--            self:resume()
--        end
--    })

--    local backgroundSize = background:getContentSize()
--
--    home:setPosition(backgroundSize.width/3, backgroundSize.height/2)
--    resume:setPosition(backgroundSize.width*2/3, backgroundSize.height/2)
--
--    local menu = ui.newMenu({home, resume})
--    menu:setPosition(display.left, display.bottom)
--
--    background:addChild(menu)
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
return PaushLayer