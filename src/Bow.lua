--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Kevin Márquez (marquezberriosk@gmail.com) for academic purpose.

    This file contains the class Bow.
]]
Bow = Class{}

function Bow:init(def, player)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = player.x
    self.y = player.y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end

    -- variable for consumable objects
    self.consumable = def.consumable

    -- onConsume function an empty function if it is not specified
    self.onConsume = def.onConsume or function() end

    -- an object could be taken or not
    self.takeable = def.takeable
    self.taken = false

    self.player = player
    print("Creando arco")
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
    self.state = self.player.direction
end

function Bow:render(adjacentOffsetX, adjacentOffsetY)
    --print(TEXTURES[self.texture])
    --print(FRAMES[self.texture][self.states[self.state].frame])
    --print(self.frame)
    --print(self.x)
    --print(self.y)
end
