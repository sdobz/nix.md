local record parser
   type HandleFence = function(block: string, infostring: string): string
   type Parser = function(markdown: string): string, table
   new: function(HandleFence): Parser
end

return parser
