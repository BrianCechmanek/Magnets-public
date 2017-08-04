local Ball   = require 'Ball'
local Magnet = require 'Magnet'
local Tile   = require 'Tile'
local Vector  = require 'vec2'

local isTile = Tile.isTileObject

local Level = {}
Level.__index = Level

local LEVEL_OBJECTS = {
  empty  = '.',
  wall   = '#',
  magnet = 'M',
  ball   = 'B',
  goal   = 'G',
}

local CHAR_TABLE = {}
for obj_id, char in pairs(LEVEL_OBJECTS) do
  CHAR_TABLE[char] = obj_id
end

local DEFAULT_LEVEL = {
  'M...................',
  '.##################.',
  '.#....#......#....#.',
  '.#....#......#.G..#.',
  '.#...........#....#.',
  '.#...........#....#.',
  '.#....#......#....#.',
  '.#....#...####....#.',
  '.#..B.#...........#.',
  '.#....#...........#.',
  '.##################.',
  '....................'
}

function Level.build(level_data)
  local data = level_data or DEFAULT_LEVEL
  local lvl = setmetatable({}, Level)

  local map = {}
  for i = 1, 12 do
    local str = data[i]
    map[i] = {}
    for j = 1, 20 do
      local obj_id = lookup(str, j)
      if isTile(obj_id) then
        map[i][j] = Tile.new(obj_id)
      else
        map[i][j] = 0
      end

      if obj_id == 'magnet' then
        lvl.magnet_start = Vector((j - 1) * 64, (i - 1) * 64)
      elseif obj_id == 'ball' then
        lvl.ball_start = Vector((j - 1) * 64, (i - 1) * 64)
      elseif obj_id == 'goal' then
        lvl.win_hole = Vector((j - 1) * 64, (i - 1) * 64)
      end
    end
  end
  lvl.map = map
  return lvl
end

function lookup(str, idx)
  local c = str:sub(idx, idx)
  return CHAR_TABLE[c]
end


return Level
