local nix = {}

local function starts(src: string, check: string): boolean
   return string.sub(src,1,string.len(check)) == check
end

local function execute(cmd: string, stdin: string): string
    local proc = assert(io.popen(cmd .. ">/tmp/unique", "w"))
    proc:write(stdin)
    proc:close()
    local output = ""
    local outf = io.open("/tmp/unique")
    if outf then
        output = outf:read("*a")
        outf:close()
        os.remove("/tmp/unique")
    end

    return output
end

function nix.handle_fence(code: string, infostring: string): string
    local output = "```" .. infostring .. "\n" .. code .. "\n```\n"
    if starts(infostring, "$") then
        local cmd = string.sub(infostring, 2, string.len(infostring))
        local res = execute(cmd, code)
        output = "```\n$".. cmd .. "\n" .. res .. "\n```"
    end

    return output
end

return nix
