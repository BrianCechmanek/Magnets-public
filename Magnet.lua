-- magnet v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Magnet = {}
Magnet.__index = Magnet

local MAX_MAGNET_SPEED = 16

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
	love.graphics.draw(self.img, self.pos.x, self.pos.y, self.rotation)
end

function Magnet:update(dt)
  self.pos = self.pos + self.vel
  if self.pos.x < 0 or self.pos.y > 1200 then
     self.pos.x = self.pos.x % 1200
  end
  if self.pos.y < 0 or self.pos.y > 720 then
     self.pos.y = self.pos.y % 720
  end
end

function Magnet:move(dx, dy)
    self.vel = self.vel + Vector(dx, dy)
    self.vel:limit(MAX_MAGNET_SPEED) -- Limit magnet velocity to our Max Speed
end

return Magnet
