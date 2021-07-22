local M = {}

M.plugin = {
    "windwp/nvim-autopairs",
    module = "nvim-autopairs",
    config = function()
        require("plugins.autopairs").config()
    end,
}

M.config = function()
   local Rule = require('nvim-autopairs.rule')
   local npairs = require("nvim-autopairs")

   npairs.setup({
     check_ts = true,
     disable_filetype = { "TelescopePrompt" , "vim" },
   })

	require("nvim-autopairs.completion.compe").setup({
	  map_cr = true,
	  map_complete = true
	})

   local ts_conds = require('nvim-autopairs.ts-conds')

   npairs.add_rules({
  		Rule(' ', ' ')
  		  	:with_pair(function (opts)
  		  	  	local pair = opts.line:sub(opts.col, opts.col + 1)
  		  	  	return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  		  	end),
  		Rule('( ', ' )')
  		   :with_pair(function() return false end)
  		   :with_move(function(opts)
  		      return opts.prev_char:match('.%)') ~= nil
  		   end)
  		   :use_key(')'),
  		Rule('{ ', ' }')
  		   :with_pair(function() return false end)
  		   :with_move(function(opts)
  		      return opts.prev_char:match('.%}') ~= nil
  		   end)
  		   :use_key('}'),
  		Rule('[ ', ' ]')
  		   :with_pair(function() return false end)
  		   :with_move(function(opts)
  		      return opts.prev_char:match('.%]') ~= nil
  		   end)
  		   :use_key(']')
   })

end

return M
