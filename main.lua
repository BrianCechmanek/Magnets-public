-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron

local Magnet = require('Magnet')

COLOUR_LIGHT_BLUE = {100, 149, 237}
COLOUR_GREY       = {119, 136, 153}

SPRITE_SIZE = 64

SCREEN_WIDTH  = 1200
SCREEN_HEIGHT = 720

assets = {}
local magnet
local ball

function DrawBorder()
  love.graphics.setLineWidth(10)
  love.graphics.setColor(COLOUR_GREY)
  love.graphics.rectangle('line', SPRITE_SIZE, SPRITE_SIZE, 
                          SCREEN_WIDTH  - (SPRITE_SIZE * 2),
                          SCREEN_HEIGHT - (SPRITE_SIZE * 2))
end

function love.load()
  assets["magnet_img"] = love.graphics.newImage('assets/magnet.png')
  print(assets.magnet_img)
  print(table.getn(assets)) 
  assets["ball_img"] = love.graphics.newImage('assets/ball.png')
  -- magnet = love.graphics.newImage('assets/magnet.png')
  ball = love.graphics.newImage('assets/ball.png')
  magnet = Magnet.create(32, 32, assets["magnet_img"])
end


-- Game initialization here


function love.draw()
  love.graphics.clear(COLOUR_LIGHT_BLUE)
  DrawBorder()
  magnet:draw()
  love.graphics.draw(ball, 600, 360)
end

function love.update(dt)
  magnet.x_pos = magnet.x_pos + magnet.dx
  if magnet.x_pos < 0 or magnet.x_pos > 1200 then
     magnet.x_pos = magnet.x_pos % 1200
  end
  magnet.y_pos = magnet.y_pos + magnet.dy
  if magnet.y_pos < 0 or magnet.y_pos > 720 then
     magnet.y_pos = magnet.y_pos % 720
  end
end

function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end

  if key == 'down' then
    magnet.dy = 16
  end

  if key == 'up' then
    magnet.dy = -16
  end

  if key == 'left' then
    magnet.dx = -16
  end

  if key == 'right' then
    magnet.dx = 16
  end
end

function love.keyreleased(key)
  if key == 'down' then
    magnet.dy = 0
  end

  if key == 'up' then
    magnet.dy = 0
  end

  if key == 'left' then
    magnet.dx = 0
  end

  if key == 'right' then
    magnet.dx = 0
  end
end

--function love.mousepressed(x, y, button, istouch)
--  if magnet:isNear(x, y) then
--    magnet:grab()
--  end
--end
