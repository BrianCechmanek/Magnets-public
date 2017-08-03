-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

mag_xpos = 32
mag_ypos = 32
dx = 0
dy = 0
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
  love.graphics.draw(magnet, mag_xpos, mag_ypos)
  love.graphics.draw(ball, 600, 360)
end

function love.update(dt)
  mag_xpos = mag_xpos + dx
  if mag_xpos < 0 or mag_xpos > 1200 then
     mag_xpos = mag_xpos % 1200
  end
  mag_ypos = mag_ypos + dy
  if mag_ypos < 0 or mag_ypos > 720 then
     mag_ypos = mag_ypos % 720
  end
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
