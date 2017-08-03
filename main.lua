-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

mag_xpos = 32
mag_ypos = 32
dx = 0
dy = 0
COLOUR_LIGHT_BLUE = {100, 149, 237}

function love.load()
  magnet = love.graphics.newImage('assets/magnet.png')
  ball = love.graphics.newImage('assets/ball.png')
end

function love.draw()
  love.graphics.draw(magnet, mag_xpos, mag_ypos)
  love.graphics.clear(COLOUR_LIGHT_BLUE)
  love.graphics.draw(ball, 600, 360)
end

function love.update(dt)
  mag_xpos = mag_xpos + dx
  mag_ypos = mag_ypos + dy

end

function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end

  if key == 'down' then
    dy = 32
  end

  if key == 'up' then
    dy = -32
  end

  if key == 'left' then
    dx = -32
  end

  if key == 'right' then
    dx = 32
  end
end

function love.keyreleased(key)
  if key == 'down' then
    dy = 0
  end

  if key == 'up' then
    dy = 0
  end

  if key == 'left' then
    dx = 0
  end

  if key == 'right' then
    dx = 0
  end
end
