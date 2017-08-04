-- magnet v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Magnet = {}
Magnet.__index = Magnet

local MAX_MAGNET_SPEED = 8

function Magnet.create(img, x, y)
  local magnet = {}
  setmetatable(magnet, Magnet)
  magnet.id = 'magnet'
  magnet.img = img
  magnet.rotation = 0
  magnet.pos = Vector(x, y)
  magnet.vel = Vector(0,0)
  magnet.is_static = true
  magnet.forceStrength = 20000 -- arbitrary k*Q strength for electric field at center for E= kQ/r^2
  return magnet
end

function Magnet:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y, 0, 2)
end

function Magnet:update(dt)
  local dest = self.pos + self.vel
  print(dest)
  if not Game.inBounds(dest.x, dest.y) or self:wouldCollide(dest) then
    self.vel = Vector(0,0)
  end
  self.pos = self.pos + self.vel
end

function Magnet:wouldCollide(dest)
  local tile = Game:getTileAt(dest.x, dest.y)
  if tile == 0 then return false end
  if tile:isSolid() then
    return Game.isColliding(self.pos, dest)
  end
end

function Magnet:move(dx, dy)
    self.vel = self.vel + Vector(dx, dy)
    self.vel:limit(MAX_MAGNET_SPEED) -- Limit magnet velocity to our Max Speed
end

function Magnet:stop()
  self.vel = Vector(0,0)
end

return Magnet
