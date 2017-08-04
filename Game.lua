local Magnet = require 'Magnet'
local Ball   = require 'Ball'
local Vector = require 'vec2'

local Game = {}
Game.__index = Game

local DEFAULT_LEVEL = {
  magnet_start = Vector(0,0),
  ball_start   = Vector(600, 300),
  win_hole     = Vector(1000, 600)
}

Game.is_running = false
Game.num_ticks  = 0
Game.clock      = 0

Game.magnet   = nil
Game.ball     = nil
Game.win_hole = nil

Game.objects = {}
Game.forceAgents = {}

function Game:start(level)
  local level   = level or DEFAULT_LEVEL

  
  self.magnet   = Magnet.create(assets['magnet.png'], level.magnet_start.x, level.magnet_start.y)
  self.ball     = Ball.create(assets['ball.png'], level.ball_start.x, level.ball_start.y)
  self.win_hole = level.win_hole

  Game:add(self.magnet, self.ball)

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

function Game:setForce(name, value)
  Game.forceAgents[name] = value
end

function Game:removeForce(name)
  Game.forceAgents[name] = nil
end

return Game
