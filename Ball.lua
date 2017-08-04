-- ball v0.1
-- authors: Brian Cechmanek, David Bergeron
local Vector = require 'vec2'

local Ball = {}
Ball.__index = Ball

local BALL_SIZE = 64

local MAX_BALL_SPEED = 48

function Ball.create(img, x, y)
  local ball = {}
  setmetatable(ball, Ball)
  ball.id= 'ball'
  ball.img = img
  ball.pos = Vector(x, y)
  ball.vel = Vector(0,0)
  ball.is_static = false
  ball.is_solid = true
  return ball
end

function Ball:draw()
  love.graphics.draw(self.img, self.pos.x, self.pos.y, 0, 2, 2)
end


function Ball:wouldCollide()
  local dest = self.pos + self.vel
  local tile = Game:getTileAt(dest.x, dest.y)
  if  tile == 0 then
    return false
  end
  if tile:isSolid() then
    return Game.isColliding(self.pos, dest)
  end
end

function Ball:stop()
  self.vel = Vector(0,0)
end

function Ball:update()
  local dest = self.pos + self.vel
  if not Game:inBounds(dest.x, dest.y) or self:wouldCollide() then
    self.vel = Vector(0,0)
  end
  self.pos = self.pos + self.vel
  self.vel:limit(MAX_BALL_SPEED) -- Limit the ball velocity to our MAX_SPEED
end


return Ball
