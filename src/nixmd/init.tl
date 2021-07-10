local markdown = require("nixmd.markdown")
local nix = require("nixmd.nix")

local nixmd = {}

local parse = markdown.new(nix.handle_fence)

function nixmd:Run()
    local output, _metadata = parse("hello")
    print(output)
end

return nixmd
