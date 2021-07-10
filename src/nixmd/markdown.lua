local lunamark = require("lunamark")

local markdown = {}

function markdown:new(fenced_code)
  local writer = lunamark.writer.generic.new()

  writer.fenced_code = fenced_code
  return lunamark.reader.markdown.new(writer, { smart = true })
end

return markdown
