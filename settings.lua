--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Alejandro Mujica
    alejandro.j.mujic4@gmail.com

    Edit by: Kevin Márquez
    marquezberrioskgmail.com

    This file contains the game settings that include dependencies, constants of values to set
    up the game, sounds, textures, frames, and fonts.
]]
Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/Bow'
require 'src/Entity'
require 'src/Boss'
require 'src/GameObject'
require 'src/Hitbox'
require 'src/Player'
require 'src/Projectile'
require 'src/BossProjectile'
require 'src/StateMachine'

require 'src/definitions/entity'
require 'src/definitions/game_objects'

require 'src/states/BaseState'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'

require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerBowShotting'
require 'src/states/entity/player/PlayerSwingSwordState'
require 'src/states/entity/player/PlayerWalkState'
require 'src/states/entity/player/PlayerPotLiftState'
require 'src/states/entity/player/PlayerPotIdleState'
require 'src/states/entity/player/PlayerPotWalkState'

require 'src/states/game/GameOverState'
require 'src/states/game/PlayState'
require 'src/states/game/StartState'

require 'src/utilities/quads'

require 'src/world/Doorway'
require 'src/world/Dungeon'
require 'src/world/Room'

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

WINDOW_WIDTH = VIRTUAL_WIDTH * 2.25
WINDOW_HEIGHT = VIRTUAL_HEIGHT * 2.25

TILE_SIZE = 16

PROBABILITY_SPAWN_CHESS = 0.2

--
-- map constants
--
MAP_WIDTH = VIRTUAL_WIDTH / TILE_SIZE - 2
MAP_HEIGHT = math.floor(VIRTUAL_HEIGHT / TILE_SIZE) - 2

MAP_RENDER_OFFSET_X = (VIRTUAL_WIDTH - (MAP_WIDTH * TILE_SIZE)) / 2
MAP_RENDER_OFFSET_Y = (VIRTUAL_HEIGHT - (MAP_HEIGHT * TILE_SIZE)) / 2

--
-- tile IDs
--
TILE_TOP_LEFT_CORNER = 4
TILE_TOP_RIGHT_CORNER = 5
TILE_BOTTOM_LEFT_CORNER = 23
TILE_BOTTOM_RIGHT_CORNER = 24

TILE_EMPTY = 19

TILE_FLOORS = {
    7, 8, 9, 10, 11, 12, 13,
    26, 27, 28, 29, 30, 31, 32,
    45, 46, 47, 48, 49, 50, 51,
    64, 65, 66, 67, 68, 69, 70,
    88, 89, 107, 108
}

TILE_TOP_WALLS = {58, 59, 60}
TILE_BOTTOM_WALLS = {79, 80, 81}
TILE_LEFT_WALLS = {77, 96, 115}
TILE_RIGHT_WALLS = {78, 97, 116}

TILE_ARROWS = {3, 7, 11, 15, 1}
TILE_BOWS = {3, 7, 11, 15, 4}
TILE_CHESS = {1, 2}

TEXTURES = {
    ['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
    ['character-swing-sword'] = love.graphics.newImage('graphics/character_swing_sword.png'),
    ['hearts'] = love.graphics.newImage('graphics/hearts.png'),
    ['switches'] = love.graphics.newImage('graphics/switches.png'),
    ['entities'] = love.graphics.newImage('graphics/entities.png'),
    ['character-pot-lift'] = love.graphics.newImage('graphics/character_pot_lift.png'),
    ['character-pot-walk'] = love.graphics.newImage('graphics/character_pot_walk.png'),
    ['chess'] = love.graphics.newImage('graphics/chest2.png'),
    ['bow'] = love.graphics.newImage('graphics/rotbow_w_string_20x20.png'),
    ['arrow'] = love.graphics.newImage('graphics/rotstring_20x20.png'),
    ['boss'] = love.graphics.newImage('graphics/boss.png'),
    ['fire-ball'] = love.graphics.newImage('graphics/fireball.png')
}

FRAMES = {
    ['tiles'] = generateQuads(TEXTURES['tiles'], 16, 16),
    ['character-walk'] = generateQuads(TEXTURES['character-walk'], 16, 32),
    ['character-swing-sword'] = generateQuads(TEXTURES['character-swing-sword'], 32, 32),
    ['hearts'] = generateQuads(TEXTURES['hearts'], 16, 16),
    ['switches'] = generateQuads(TEXTURES['switches'], 16, 18),
    ['entities'] = generateQuads(TEXTURES['entities'], 16, 16),
    ['character-pot-lift'] = generateQuads(TEXTURES['character-pot-lift'], 16, 32),
    ['character-pot-walk'] = generateQuads(TEXTURES['character-pot-walk'], 16, 32),
    ['chess'] = generateQuads(TEXTURES['chess'], 32, 32),
    ['bow'] = generateQuads(TEXTURES['bow'], 20, 20),
    ['arrow'] = generateQuads(TEXTURES['arrow'], 20, 20),
    ['boss'] = generateQuads(TEXTURES['boss'], 16, 31),
    ['fire-ball'] = generateQuads(TEXTURES['fire-ball'], 28, 28)
}

FONTS = {
    ['princess'] = love.graphics.newFont('fonts/princess.otf', 32),
    ['princess-small'] = love.graphics.newFont('fonts/princess.otf', 24)
}

SOUNDS = {
    ['start-music'] = love.audio.newSource('sounds/start_music.mp3', 'static'),
    ['dungeon-music'] = love.audio.newSource('sounds/dungeon_music.mp3', 'static'),
    ['game-over-music'] = love.audio.newSource('sounds/game_over_music.mp3', 'static'),
    ['sword'] = love.audio.newSource('sounds/sword.wav', 'static'),
    ['pot-wall'] = love.audio.newSource('sounds/pot_wall.wav', 'static'),
    ['hit-enemy'] = love.audio.newSource('sounds/hit_enemy.wav', 'static'),
    ['hit-player'] = love.audio.newSource('sounds/hit_player.wav', 'static'),
    ['door'] = love.audio.newSource('sounds/door.wav', 'static'),
    ['heart-taken'] = love.audio.newSource('sounds/heart_taken.wav', 'static'),
    ['shoot-arrow'] = love.audio.newSource('sounds/shoot_arrow.mp3', 'static'),
    ['take'] = love.audio.newSource('sounds/take.mp3', 'static'),
    ['trunk'] = love.audio.newSource('sounds/trunk.mp3', 'static'),
    ['flying-arrow'] = love.audio.newSource('sounds/flying_arrow.mp3', 'static'),
    ['fire-short'] = love.audio.newSource('sounds/fire_short.mp3', 'static'),
    ['fire-long'] = love.audio.newSource('sounds/fire_long.mp3', 'static'),
    ['boss-room-music'] = love.audio.newSource('sounds/boss_battle_music_zeldalike.mp3', 'static')
}
