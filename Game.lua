local Magnet = require 'Magnet'
local Ball   = require 'Ball'
local Level  = require 'Level'
local Vector = require 'vec2'

local Game = {}
Game.__index = Game

local GAME_WIDTH  = 20
local GAME_HEIGHT = 12

local DEFAULT_LEVEL = {
  magnet_start = Vector(0,0),
  ball_start   = Vector(600, 300),
  win_hole     = Vector(1000, 600)
}

Game.is_running = false
Game.num_ticks  = 0
Game.clock      = 0

Game.map      = nil

Game.magnet   = nil
Game.ball     = nil
Game.win_hole = nil

Game.objects = {}
Game.forceAgents = {}

function Game:start(level_data)
  local level   = Level.build(level_data)
  self.map = level.map
  
  self.magnet   = Magnet.create(assets['magnet.png'], level.magnet_start.x, level.magnet_start.y)
  self.ball     = Ball.create(assets['ball.png'], level.ball_start.x, level.ball_start.y)
  self.win_hole = level.win_hole

  Game:add(self.magnet, self.ball)
  Game:forceTable()

  self.is_running = true
end


function Game:update(dt)
  for _, obj in ipairs(self.objects) do
    if not obj.is_static then
      Game:sumForcesOnObj(forceAgents, obj)
    end
    obj:update(dt)
  end

  self.num_ticks = self.num_ticks + 1
end

function Game:drawObjects()
  for _, obj in ipairs(self.objects) do
    obj:draw()
  end
end

function Game:drawMap()
  for i = 1, GAME_HEIGHT do
    for j = 1, GAME_WIDTH do
      local tile = self.map[i][j]
      if tile ~= 0 then
        tile:draw(j * 64, i * 64)
      end
    end
  end
end

function Game:add(...)
  local new_objs = {...}
  for _, obj in ipairs(new_objs) do
    table.insert(self.objects, obj)
  end
end

function Game:forceTable()
  for _, obj in ipairs(self.objects) do
    Game.forceAgents[obj] = obj.forceStrength
  end
 end  

function Game:setForce(name)
  Game.forceAgents[name] = name.charge
end

function Game:removeForce(name)
  Game.forceAgents[name] = nil
end

function Game:sumForcesOnObj(forceAgents, obj)
  --[[ Calculates the sum of all (vector) forces on the supplied object.
       Loop through each force in Game.forceAgents, extracting 
           force = {source.x_pos, source.y_pos, source.strength (k*Q)}
           dist = sqrt((source.x_pos-obj.x_pos)^2 + (source.y_pos-obj.y_pos)^2)
           force = unit vector of x-distance*magnitude/distance, ditto y    
        add force Vector to object net force 
  ]]
  local sum = Vector(0,0)
  local dist = 0
  local magnitude = 0
  local unitVector = Vector(0,0)

  for agent, val in pairs(Game.forceAgents) do
    dist = agent.pos:dist(obj.pos)
    magnitude = val/(dist^2)
    unitVector = Vector((agent.pos.x-obj.pos.x)*magnitude/dist, (agent.pos.y-obj.pos.y)*magnitude/dist)
    sum = sum:add(unitVector)
  end
  obj.vel = sum
end

return Game
