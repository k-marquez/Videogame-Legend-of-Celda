--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Kevin Márquez (marquezberrioskgmail@gmail.com) for academic purpose.

    This file contains the class PlayerBowShotting.
]]
PlayerBowShotting = Class{__includes = BaseState}

function PlayerBowShotting:init(player, dungeon)
    self.player = player

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 8

    self.player:changeAnimation('bow-' .. self.player.direction)
end

function PlayerBowShotting:enter(params)
    SOUNDS['sword']:stop()
    SOUNDS['sword']:play()

    -- restart bow swing animation
    self.player.currentAnimation:refresh()
end

function PlayerBowShotting:update(dt)
    self.player.bow:update(dt)
    
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end

    if love.keyboard.wasPressed('d') and self.player.bow ~= nil then
        self.player:changeState('shot-bow')
    elseif love.keyboard.wasPressed('space') then
        self.player:changeState('swing-sword')
    end
end

function PlayerBowShotting:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

    self.player.bow:render(self.player.offsetX, self.player.offsetY)
end