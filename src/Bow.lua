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
    print(self.texture)
    print(self.type)
    print(self.solid)

    print(self.defaultState)
    print(self.state)
    print(self.states)

    print(self.width)
    print(self.height)

    print(self.onCollide)

    print(self.consumable)

    print(self.onConsume)

    print(self.takeable)
    print(self.taken)
    print(TEXTURES[self.texture])
    print(FRAMES[self.texture][self.states[self.state].frame])
    print(self.frame)
    print(self.x)
    print(self.y)
end

function Bow:shot()
    print("Disparé")
end

function Bow:update(dt)
    -- update state of bow based on where the player is and facing
    print("Update frame and state of bow")
    self.state = self.player.direction
    self.frame = self.states[self.state].frame
end

function Bow:render(adjacentOffsetX, adjacentOffsetY)
    self.player.bow:shot()
    --print(TEXTURES[self.texture])
    --print(FRAMES[self.texture][self.states[self.state].frame])
    --print(self.frame)
    --print(self.x)
    --print(self.y)
end
