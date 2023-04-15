--[[
    ISPPJ1 2023
    Study Case: The Legend of the Princess (ARPG)

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Modified by Alejandro Mujica (alejandro.j.mujic4@gmail.com) for teaching purpose.

    Modified by Kevin Márquez (marquezberriosk@gmail.com) for academic purpose.

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
        frame = 15,
        width = 20,
        height = 20,
        solid = true,
        consumable = false,
        defaultState = 'down',
        takeable = false,
        states = {
            ['up'] = {
                frame = 7
            },
            ['down'] = {
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
            ['down'] = {
                frame = 11
            },
            ['left'] = {
                frame = 15
            },
            ['right'] = {
                frame = 15
            }
        },
        ['fire-ball'] = {
            type = 'fire-ball',
            texture = 'fire-ball',
            frame = 1,
            width = 14,
            height = 14,
            solid = true,
            consumable = false,
            defaultState = 'left',
            takeable = false,
            states = {
                ['up'] = {
                    frame = {17,18,19,20,21,22,23,24}
                },
                ['down'] = {
                    frame = {49,50,51,52,53,54,55,56}
                },
                ['left'] = {
                    frame = {1,2,3,4,5,6,7,8}
                },
                ['right'] = {
                    frame = {33,34,35,36,37,38,39,40}
                },
                ['up-lef'] = {
                    frame = {9,10,11,12,13,14,15,16}
                },
                ['down-lef'] = {
                    frame = {57,58,59,60,61,62,63,64}
                },
                ['up-right'] = {
                    frame = {25,26,27,28,29,30,31,32}
                },
                ['down-right'] = {
                    frame = {41,42,43,44,45,46,47,48}
                }
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
    },
    ['bow-takeable'] = {
        type = 'bow-takeable',
        texture = 'bow',
        frame = 4,
        width = 20,
        height = 20,
        solid = false,
        consumable = true,
        defaultState = 'default',
        takeable = false,
        states = {
            ['default'] = {
                frame = 4
            }
        },
        onConsume = function(player)
            player:take_bow()
            SOUNDS['take']:play()
        end
    },
}
