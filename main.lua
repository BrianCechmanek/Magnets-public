function love.load()
end


function love.draw()
end


function love.update()
end


function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end
end
