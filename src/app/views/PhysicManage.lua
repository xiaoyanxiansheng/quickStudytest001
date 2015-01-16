local world
local PhysicsManage = class("PhysicManage",function()
    --创建一个物理世界
    return display.newPhysicsScene()
end)
collisionType = {}
collisionType.kCollisionTyoePlayer = 1
collisionType.kCollisionTyoeEnemy = 1

function PhysicsManage:getInstance()
    if world == nil then
        world = PhysicsManage.new()
    end
    return world
end

return PhysicsManage