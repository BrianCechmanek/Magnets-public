-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

COLOUR_LIGHT_BLUE = {100, 149, 237}
COLOUR_GREY       = {119, 136, 153}

SPRITE_SIZE = 64

SCREEN_WIDTH  = 1200
SCREEN_HEIGHT = 720

function DrawBorder()
  love.graphics.setLineWidth(10)
  love.graphics.setColor(COLOUR_GREY)
  love.graphics.rectangle('line', SPRITE_SIZE, SPRITE_SIZE, 
                          SCREEN_WIDTH  - (SPRITE_SIZE * 2),
                          SCREEN_HEIGHT - (SPRITE_SIZE * 2))
end

function love.load()
  magnet = love.graphics.newImage('assets/magnet.png')
  ball = love.graphics.newImage('assets/ball.png')
end


function love.draw()
  love.graphics.clear(COLOUR_LIGHT_BLUE)
  DrawBorder()
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
