local Util = {}
Util.__index = Util

function util.clamp(x, min, max)
  if x < min then
    return min
  elseif x > max then 
    return max
  else 
    return x
  end
end

return Util
