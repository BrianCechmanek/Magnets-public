-- Magnet Game v.01
-- Brian Cechmanek, David Bergeron
local lg = love.graphics

Game = require 'Game'


COLOUR_LIGHT_BLUE = {100, 149, 237}
COLOUR_GREY       = {119, 136, 153}

SPRITE_SIZE = 64
SCREEN_WIDTH  = 1280
SCREEN_HEIGHT = 768

assets = {}
function LoadAssets()
  local files = love.filesystem.getDirectoryItems('assets')
  for _, file in ipairs(files) do
    assets[file] = lg.newImage('assets/' .. file)
  end
end

function love.load()
  LoadAssets()
  Game:start()
end


function love.draw()
  DrawBackground()
  Game:drawMap()
  Game:drawObjects()
  if Game.victory == true then
    love.graphics.print('WINNER WINNER  BABY YEAAAH', SCREEN_WIDTH/3, SCREEN_HEIGHT/2, 0, 3)
  end
end


function love.update(dt)
  Game:update(dt)
end


function love.keypressed(key)
  if key == 'q' or key == 'escape' then
    love.event.quit()
  end

  if key == 'down' then
    Game.magnet:move(0, 16)
  end

  if key == 'up' then
    Game.magnet:move(0, -16)
  end

  if key == 'left' then
    Game.magnet:move(-16, 0)
  end

  if key == 'right' then
    Game.magnet:move(16, 0)
  end

  if key == 'space' then
    Game.magnet:stop()
  end
end


function love.keyreleased(key)
  if key == 'down' then
    Game.magnet.dy = 0
  end

  if key == 'up' then
    Game.magnet.dy = 0
  end

  if key == 'left' then
    Game.magnet.dx = 0
  end

  if key == 'right' then
    Game.magnet.dx = 0
  end
end

function DrawBackground()
  lg.clear(COLOUR_LIGHT_BLUE)
end

function DrawBorder()
  lg.setLineWidth(10)
  lg.setColor(COLOUR_GREY)
  lg.rectangle('line', SPRITE_SIZE, SPRITE_SIZE, 
                          SCREEN_WIDTH  - (SPRITE_SIZE * 2),
                          SCREEN_HEIGHT - (SPRITE_SIZE * 2))
end


