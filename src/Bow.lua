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
    print("Creando arco")
end

function Bow:shot()
    print("Disparé")
end

function Bow:update(dt)
    -- update state of bow based on where the player is and facing
    self.state = self.player.direction
    self.x = self.player.x
    self.y = self.player.y
    self.frame = self.states[self.state].frame
end

function Bow:render()
    local anim = self.player.currentAnimation
    local offsetBowY = nil
    local offsetBowX = nil
    if self.state == 'up' then
        offsetBowY = 5
        offsetBowX = 3
        -- rendering bow
        love.graphics.draw(TEXTURES[self.texture], FRAMES[self.texture][self.states[self.state].frame or self.frame],
            self.x - offsetBowX, self.y - offsetBowY)
        -- rendering player
        love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
            math.floor(self.player.x), math.floor(self.player.y - self.player.offsetY))
    else
        if self.state == 'left' then
            offsetBowX = - 7
            offsetBowY = 1
        elseif self.state == 'right' then
            offsetBowX = 2
            offsetBowY = 1
        else
            offsetBowX = -2
            offsetBowY = 7
        end
        -- rendering player
        love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
            math.floor(self.player.x), math.floor(self.player.y - self.player.offsetY))
        -- rendering bow
        love.graphics.draw(TEXTURES[self.texture], FRAMES[self.texture][self.states[self.state].frame or self.frame],
            self.x + offsetBowX, self.y + offsetBowY)
    end
end
