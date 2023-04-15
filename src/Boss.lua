--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Alejandro Mujica (alejandro.j.mujic4@gmail.com) for teaching purpose.

    Modified by Kevin Márquez (marquezberriosk@gmail.com) for academic purpose.

    Modified by Lewis Ochoa (lewis8a@gmail.com) for academic purpose.

    This file contains the class BossEnemy.
]]

Boss = Class{__includes = Entity}

function Boss:init(def)
    Entity.init(self, def)
    self.room = def.room
    self.player = def.player
    self.fire = false
end

function Boss:attack()
    self.fire = true
    local fire_ball = GameObject(GAME_OBJECT_DEFS['fire-ball'], self.x, self.y)
    local x_end = self.player.x + self.player.width / 2
    local y_end = self.player.y + self.player.height / 2
    
    table.insert(self.room.boss_projectiles, BossProjectile{
        obj = fire_ball,
        boss = self,
        x = x_end,
        y = y_end
    })
end

function Boss:update(dt)
    -- probabily of generate an attack
    if math.random() < 0.01 and not self.fire then
        self:attack()
    end

    Entity.update(self, dt)
end

function Boss:collides(target)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2

    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                selfY + selfHeight < target.y or selfY > target.y + target.height)
end

function Boss:render()
    Entity.render(self)
end