-- magnet v0.1
-- authors: Brian Cechmanek, David Bergeron

local Magnet = {}
Magnet.__index = Magnet

function Magnet.create(x_pos, y_pos, img)
	local magnet = {}
	setmetatable(magnet, Magnet)
	magnet.img = img
	magnet.x_pos = x_pos
	magnet.y_pos = y_pos
	magnet.dx = 0
	magnet.dy = 0
	return magnet
end

function Magnet:move(dx, dy)
    self.x_pos = self.x_pos + dx
    self.y_pos = self.y_pos + dy
end

function Magnet:draw()
	love.graphics.draw(self.img, self.x_pos, self.y_pos)
end


return Magnet