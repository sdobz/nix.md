local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local io = _tl_compat and _tl_compat.io or io; local markdown = require("nixmd.markdown")
local nix = require("nixmd.nix")

local nixmd = {}

local parse = markdown.new(nix.handle_fence)

function nixmd:Run()
   local input = io.read("*a")
   local output, _metadata = parse(input)
   print(output)
end

return nixmd
