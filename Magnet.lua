-- magnet v0.1
-- authors: Brian Cechmanek, David Bergeron

local Magnet = {}
Magnet.__index = Magnet

function Magnet.create(img, x_pos, y_pos)
	local magnet = {}
	setmetatable(magnet, Magnet)
	magnet.img = img
	magnet.x_pos = x_pos
	magnet.y_pos = y_pos
	magnet.dx = 0
	magnet.dy = 0
	return magnet
end

function Magnet:draw()
	love.graphics.draw(self.img, self.x_pos, self.y_pos)
end

function Magnet:update(dt)
  self.x_pos = self.x_pos + self.dx
  if self.x_pos < 0 or self.x_pos > 1200 then
     self.x_pos = self.x_pos % 1200
  end
  self.y_pos = self.y_pos + self.dy
  if self.y_pos < 0 or self.y_pos > 720 then
     self.y_pos = self.y_pos % 720
  end
end

function Magnet:move(dx, dy)
    self.x_pos = self.x_pos + dx
    self.y_pos = self.y_pos + dy
end

return Magnet
