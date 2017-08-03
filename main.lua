-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

function love.load()
  magnet = love.graphics.newImage('assets/magnet.png')
end


function love.draw()
  love.graphics.draw(magnet, 100, 100)
end


function love.update(dt)
end


function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end
end
