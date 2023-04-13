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
    print("Update frame and state of bow")
    self.state = self.player.direction
    self.x = self.player.x
    self.y = self.player.y
    self.frame = self.states[self.state].frame
end

function Bow:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(TEXTURES[self.texture], FRAMES[self.texture][self.states[self.state].frame or self.frame],
        self.x , self.y + adjacentOffsetY)
end
