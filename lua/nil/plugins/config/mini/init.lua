local path = (...):gsub('%.init%', '')

local comment = require(path .. '.comment')
local pairs = require(path .. '.pairs')
local pick = require(path .. '.pick')

return {
    { 'echasnovski/mini.comment', config = comment.config },
    { 'echasnovski/mini.pairs', config = pairs.config },
    { 'echasnovski/mini.pick', config = pick.config, keys = pick.keys },
}
