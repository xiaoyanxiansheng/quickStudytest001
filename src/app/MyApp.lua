
require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    --添加图片缓存
    display.addSpriteFrames("image/role.plist", "image/role.pvr.ccz")
    display.addSpriteFrames("image/ui.plist", "image/ui.pvr.ccz")
    --添加声音缓存
    self:enterScene("MainScene")
end

return MyApp
