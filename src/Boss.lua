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
    --self.room = def.room
    --self.player = def.player
    self.fire = false
end

function Boss:attack()
    if math.random() < 1 then
        self.fire = true
        local x_end = self.player.x + self.player.width / 2
        local y_end = self.player.y + self.player.height / 2
        local fire_ball = GameObject(GAME_OBJECT_DEFS['fire-ball'], self.x, self.y)
        local dif_x = math.floor(self.x - x_end)
        local dif_y = math.floor(self.y - y_end)
        if dif_x == 0 then
            if dif_y > 0 then
                fire_ball.state = 'up'
                fire_ball.frame = 17
            else
                fire_ball.state = 'down'
                fire_ball.frame = 49
            end
        elseif dif_y == 0 then
            if dif_x > 0 then
                fire_ball.state = 'left'
                fire_ball.frame = 1
            else
                fire_ball.state = 'right'
                fire_ball.frame = 33
            end
        elseif dif_x < 0 then
            if dif_y < 0 then
                fire_ball.state = 'down-right'
                fire_ball.frame = 41
            else
                fire_ball.state = 'up-right'
                fire_ball.frame = 25
            end
        else
            if dif_y < 0 then
                fire_ball.state = 'down-left'
                fire_ball.frame = 57
            else
                fire_ball.state = 'up-left'
                fire_ball.frame = 9
            end
        end

        table.insert(self.room.projectiles, BossProjectile{
            obj = GAME_OBJECT_DEFS['fire-ball'],
            boss = self,
            x = x_end,
            y = y_end
        })
    end
end

function Boss:update(dt)
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