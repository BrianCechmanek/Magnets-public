local Vector = require 'vec2'

local Tile = {}
Tile.__index = Tile

local TILE_TYPES = {
  wall = {
    is_solid = true,
    is_static = true,
    img = 'wall.png'
  },
  goal = {
    is_static = true,
    img = 'goal_hole.png'
  }
}

function Tile.new(id)
  assert(TILE_TYPES[id], 'Tile ID: ' .. id ..' does not exist!')
  local t = setmetatable({}, Tile)
  t.id = id
  return t
end

function Tile:draw(x, y)
  local tile = Tile.get(self.id)
  love.graphics.draw(assets[tile.img], x, y)
end

function Tile:isSolid()
  local t = Tile.get(self.id)
  return t.is_solid == true
end

function Tile.get(id)
  return TILE_TYPES[id]
end

function Tile.isTileObject(id)
  return Tile.get(id) ~= nil
end

return Tile


