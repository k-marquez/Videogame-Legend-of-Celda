--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Alejandro Mujica
    alejandro.j.mujic4@gmail.com

    This file contains the class Boss Projectile.
]]
local BOSS_PROJECTILE_SPEED = 100

BossProjectile = Class{__includes = Projectile}

function BossProjectile:init(def)
    Projectile.init(self, def.obj, "up")
    self.end_x = def.x
    self.end_y = def.y
    self.dead = false

    local toTween = {
        [self] = {x = self.end_x, y = self.end_y}
    }

    -- for move the projectile
    Timer.tween(1,toTween)
end

function BossProjectile:update(dt)
    if self.dead then
        return
    end

    if self.end_x == self.obj.x and self.end_y == self.obj.y then
        self.dead = true
    end

    if self.dead then
        SOUNDS['pot-wall']:play()
        return
    end
end

function BossProjectile:render()
    self.obj:render(0, 0)
end
