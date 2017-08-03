local Magnet = require 'Magnet'
-- local Ball   = require 'Ball'

local Game = {}
Game.__index = Game

local DEFAULT_LEVEL = {
  magnet_start = {x = 0, y = 0},
  ball_start   = {x = 600, y = 300},
  win_hole     = {x = 1000, y = 600}
}

Game.is_running = false
Game.num_ticks  = 0
Game.clock      = 0

Game.magnet   = nil
Game.ball     = nil
Game.win_hole = nil

Game.objects = {}

function Game:start(level)
  local level   = level or DEFAULT_LEVEL

  self.magnet   = Magnet.create(level.magnet_start.x, level.magnet_start.y, assets['magnet_img'])
  --self.ball     = Ball.create(level.ball_start.x, level.ball_start.y, assets['ball_img'])
  self.win_hole = level.win_hole

  Game:add(self.magnet)
  --Game:add(self.magnet, self.ball)

  self.is_running = true
end


function Game:update(dt)
  for _, obj in ipairs(self.objects) do
    obj:update(dt)
  end

  self.num_ticks = self.num_ticks + 1
end

function Game:drawObjects()
  for _, obj in ipairs(self.objects) do
    obj:draw()
  end
end

function Game:add(...)
  local new_objs = {...}
  for _, obj in ipairs(new_objs) do
    table.insert(self.objects, obj)
  end
end

return Game
