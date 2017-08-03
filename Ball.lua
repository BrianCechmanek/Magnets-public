-- ball v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Ball = {}
Ball.__index = Ball

function Ball.create(img, x, y)
  local ball = {}
  setmetatable(ball, Ball)
  ball.img = img
  ball.pos = Vector(x, y)
  ball.vel = Vector(0,0)
  --ball.gravity = 1
  return ball
end

function Ball:draw()
  love.graphics.draw(self.img, self.pos.x, self.y_pos)
end

function Ball:move(delta_vec)
  self.pos = self.pos + delta_vec
end

function Ball:update()
end

return Ball
