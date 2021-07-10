local bash_writer = require("bash_writer")

local nixmd = {}

function nixmd:Run()
    print(bash_writer.parse("Test [url](/url??)"))
end

return nixmd
