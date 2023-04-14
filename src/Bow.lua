--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Kevin Márquez (marquezberriosk@gmail.com) for academic purpose.

    This file contains the class Bow.
]]
Bow = Class{__includes = GameObject}

function Bow:init(def)
    GameObject.init(self, def.definition_obj, def.player.x, def.player.y)
    self.player = def.player
    self.state = self.player.direction
    self.frame = self.states[self.state].frame
    self.offsetBowY = 0
    self.offsetBowX = 0
end

function Bow:shot()
    local x = self.x + self.offsetBowX
    local y = self.y + self.offsetBowY
    local arrow = GameObject(GAME_OBJECT_DEFS['arrow'], x, y)
    arrow.state = self.state
    table.insert(self.dungeon.currentRoom.projectiles, Projectile(arrow, self.player.direction))
end

function Bow:update(dt)
    -- update state of bow based on where the player is and facing
    self.state = self.player.direction
    self.x = self.player.x
    self.y = self.player.y
    self.frame = self.states[self.state].frame
    if self.state == 'up' then
        self.offsetBowY = 5
        self.offsetBowX = 3
    elseif self.state == 'left' then
        self.offsetBowX = - 7
        self.offsetBowY = 1
    elseif self.state == 'right' then
        self.offsetBowX = 2
        self.offsetBowY = 1
    else
        self.offsetBowX = -2
        self.offsetBowY = 7
    end
end

function Bow:render()
    local anim = self.player.currentAnimation

    if self.state == 'up' then
        -- rendering bow
        love.graphics.draw(TEXTURES[self.texture], FRAMES[self.texture][self.states[self.state].frame or self.frame],
            self.x - self.offsetBowX, self.y - self.offsetBowY)
        -- rendering player
        love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
            math.floor(self.player.x), math.floor(self.player.y - self.player.offsetY))
    else
        -- rendering player
        love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
            math.floor(self.player.x), math.floor(self.player.y - self.player.offsetY))
        -- rendering bow
        love.graphics.draw(TEXTURES[self.texture], FRAMES[self.texture][self.states[self.state].frame or self.frame],
            self.x + self.offsetBowX, self.y + self.offsetBowY)
    end
end
