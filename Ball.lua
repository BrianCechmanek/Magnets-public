-- ball v0.1
-- authors: Brian Cechmanek, David Bergeron

local Ball = {}
Ball.__index = Ball

function Ball.create(img, x_pos, y_pos)
  local ball = {}
  setmetatable(ball, Ball)
  ball.img = img
  ball.x_pos = x_pos
  ball.y_pos = y_pos
  ball.dx = 0
  ball.dy = 0
  --ball.gravity = 1
  return ball
end

function Ball:draw()
  love.graphics.draw(self.img, self.x_pos, self.y_pos)
end

function Ball:move(dx, dy)
    self.x_pos = self.x_pos + dx
    self.y_pos = self.y_pos + dy
end

function Ball:update()
end

return Ball
