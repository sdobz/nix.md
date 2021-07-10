local lunamark = require("lunamark")
local writer = lunamark.writer.html.new()

function writer.link(lab,url,title)
  return lab
end
local parse = lunamark.reader.markdown.new(writer, { smart = true })

return {
  parse = parse
}