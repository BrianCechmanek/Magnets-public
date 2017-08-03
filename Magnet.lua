-- magnet v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Magnet = {}
Magnet.__index = Magnet

function Magnet.create(img, pos.x, pos.y)
	local magnet = {}
	setmetatable(magnet, Magnet)
	magnet.img = img
  magnet.pos = Vector(pos.x, pos.y)
  magnet.vel = Vector(0,0)
	return magnet
end

function Magnet:draw()
	love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Magnet:update(dt)
  self.pos.x = self.pos.x + self.dx
  if self.pos.x < 0 or self.pos.y > 1200 then
     self.pos.x = self.pos.x % 1200
  end
  self.pos.y = self.pos.y + self.dy
  if self.pos.y < 0 or self.pos.y > 720 then
     self.pos.y = self.pos.y % 720
  end
end

function Magnet:move(delta_vec)
    self.pos = self.pos + delta_vec
end

return Magnet
