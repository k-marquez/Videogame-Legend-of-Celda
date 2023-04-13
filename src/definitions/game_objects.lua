--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Alejandro Mujica (alejandro.j.mujic4@gmail.com) for teaching purpose.

    This file contains the definition for game objects.
]]
GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['chess'] = {
        type = 'chess',
        texture = 'chess',
        frame = 1,
        width = 32,
        height = 32,
        solid = true,
        defaultState = 'closed',
        states = {
            ['closed'] = {
                frame = 1
            },
            ['opened'] = {
                frame = 2
            }
        }
    },
    ['bow'] = {
        type = 'bow',
        texture = 'bow',
        frame = 1,
        width = 20,
        height = 20,
        solid = true,
        consumable = false,
        defaultState = 'default',
        takeable = true,
        states = {
            ['default'] = {
                frame = 4
            },
            ['up'] = {
                frame = 7
            },
            ['bottom'] = {
                frame = 15
            },
            ['left'] = {
                frame = 11
            },
            ['right'] = {
                frame = 3
            }
        }
    },
    ['arrow'] = {
        type = 'arrow',
        texture = 'arrow',
        frame = 1,
        width = 20,
        height = 20,
        solid = true,
        consumable = false,
        defaultState = 'default',
        takeable = false,
        states = {
            ['default'] = {
                frame = 1
            },
            ['up'] = {
                frame = 11
            },
            ['bottom'] = {
                frame = 11
            },
            ['left'] = {
                frame = 15
            },
            ['right'] = {
                frame = 15
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'tiles',
        frame = 16,
        width = 16,
        height = 16,
        solid = true,
        consumable = false,
        defaultState = 'default',
        takeable = true,
        states = {
            ['default'] = {
                frame = 16
            }
        }
    },
    -- definition of heart as a consumable object type
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        consumable = true,
        defaultState = 'default',
        states = {
            ['default'] = {
                frame = 5
            }
        },
        onConsume = function(player)
            player:heal(2)
            SOUNDS['heart-taken']:play()
        end
    }
}
