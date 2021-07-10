local lunamark = require("lunamark")

local markdown = {}

local lunamark = require("lunamark")

function markdown.new(fenced_code)
  local writer = lunamark.writer.html.new()

  writer.fenced_code = fenced_code

  return lunamark.reader.markdown.new(writer, { smart = true, fenced_code_blocks = true })
end

return markdown
