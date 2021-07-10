local nix = {}

local function starts(src: string, check: string): boolean
   return string.sub(src,1,string.len(check)) == check
end

local function execute(cmd: string, _stdin: string): string
    local file = assert(io.popen(cmd, "r"))
    --file:write(stdin)
    local output = file:read('*all')
    file:close()
    return output
end

function nix.handle_fence(code: string, infostring: string): string
    local output = "```" .. infostring .. "\n" .. code .. "\n```\n"
    if starts(infostring, "$") then
        local cmd = string.sub(infostring, 2, string.len(infostring))
        local res = execute(cmd, code)
        output = "```\n$ ".. cmd .. "\n" .. res .. "\n```"
    end

    return output
end

return nix
