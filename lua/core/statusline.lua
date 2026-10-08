local function mode_name()
	local names = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["^V"] = "V-BLOCK",
		R = "REPLACE",
		c = "COMMAND",
		t = "TERMINAL",
	}
	return names[vim.fn.mode()]
end

local function current_branch()
	local res = vim.fn.systemlist(
		"git branch --show-current"
	)

	if #res == 0 then
		return ""
	end

	return "Branch: " .. res[1]
end

local function current_lsp()
	local clients = vim.lsp.get_clients(
		{ bufnr = 0 }
	)

	if #clients == 0 then
		 return "None"
	 end

	return clients[1].name
end

_G.mode_name = mode_name
_G.current_branch = current_branch
_G.current_lsp = current_lsp


vim.opt.statusline = 
	"%{v:lua.mode_name()} " ..
	"%t " .. 
	"[%{v:lua.current_branch()}] " ..
	"%y " ..
	"%h%w%q " ..
	"%m%r " ..
	"[Bufnr: %n][Args: %a] " ..
	"%= " ..
	"[LSP: %{v:lua.current_lsp()}] " ..
	"Row:%L,Col:%c %p%%"
