-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

COLOUR_LIGHT_BLUE = {100, 149, 237}

function love.load()
  magnet = love.graphics.newImage('assets/magnet.png')
  ball = love.graphics.newImage('assets/ball.png')
end


function love.draw()
  love.graphics.clear(COLOUR_LIGHT_BLUE)
  love.graphics.draw(magnet, 100, 100)
  love.graphics.draw(ball, 600, 360)
end


function love.update(dt)
end


function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end
end
