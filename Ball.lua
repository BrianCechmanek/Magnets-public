-- ball v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Ball = {}
Ball.__index = Ball

local MAX_BALL_SPEED = 48

function Ball.create(img, x, y)
  local ball = {}
  setmetatable(ball, Ball)
  ball.img = img
  ball.pos = Vector(x, y)
  ball.vel = Vector(0,0)

  ball.is_solid = true
  --ball.gravity = 1
  return ball
end

function Ball:draw()
  love.graphics.draw(self.img, self.pos.x, self.pos.y)
end

function Ball:move(dx, dy)
  self.vel = self.vel + Vector(dx, dy)
  self.vel:limit(MAX_BALL_SPEED) -- Limit the ball velocity to our MAX_SPEED
end

function Ball:update()
end

return Ball
