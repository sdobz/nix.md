local lunamark = require("lunamark")

local markdown = {}

local lunamark = require("lunamark")

function markdown:new(fenced_code)
  local writer = lunamark.writer.html.new()

  function writer.link(l,u,t)
    print('here')
    return l
  end

  function writer.fenced_code(l,i)
    print('here 2')
    return l
  end

  
  return lunamark.reader.markdown.new(writer, { smart = true })
end

return markdown
