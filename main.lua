-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron
local lg = love.graphics

local Game = require 'Game'
local Magnet = require('Magnet')
local Ball = require('Ball')


COLOUR_LIGHT_BLUE = {100, 149, 237}
COLOUR_GREY       = {119, 136, 153}

SPRITE_SIZE = 64

SCREEN_WIDTH  = 1200
SCREEN_HEIGHT = 720

assets = {}
local magnet
local ball

function love.load()
<<<<<<< HEAD
  assets["magnet_img"] = lg.newImage('assets/magnet.png')
  assets["ball_img"] = lg.newImage('assets/ball.png')
  --magnet = Magnet.create(32, 32, assets["magnet_img"])
  ball = assets['ball_img']
  Game:start()
end

=======
  assets["magnet_img"] = love.graphics.newImage('assets/magnet.png')
  assets["ball_img"] = love.graphics.newImage('assets/ball.png')

  magnet = Magnet.create(assets["magnet_img"], 32, 32)
  ball = Ball.create(assets["ball_img"], 600, 360)
end
>>>>>>> ec744411479af2cbd82cd394be1a738f1efe8bb0

function love.draw()
  DrawBackground()
  DrawBorder()
<<<<<<< HEAD
  Game:drawObjects()
  lg.draw(ball, 600, 360)
=======
  magnet:draw()
  ball:draw()
>>>>>>> ec744411479af2cbd82cd394be1a738f1efe8bb0
end

function love.update(dt)
  Game:update(dt)
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

function DrawBackground()
  lg.clear(COLOUR_LIGHT_BLUE)                    --function love.mousepressed(x, y, button, istouch)
end                                                         --  if magnet:isNear(x, y) then
                                                            --    magnet:grab()
function DrawBorder()                                       --  end
  lg.setLineWidth(10)                            --end
  lg.setColor(COLOUR_GREY)
  lg.rectangle('line', SPRITE_SIZE, SPRITE_SIZE, 
                          SCREEN_WIDTH  - (SPRITE_SIZE * 2),
                          SCREEN_HEIGHT - (SPRITE_SIZE * 2))
end
