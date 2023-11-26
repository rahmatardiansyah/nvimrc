local M = {}

function M.capture(cmd, raw)
	local fs = assert(io.popen(cmd, 'r'))
	local fr = assert(fs:read('*a'))
	fs:close()
	if raw then
		return fr
	end
	fr = string.gsub(fr, '^%s+', '')
	fr = string.gsub(fr, '%s+$', '')
	fr = string.gsub(fr, '[\n\r]+', ' ')
	return fr
end

function M.cowboy()
	---@type table?
	local id
	local ok = true
	for _, key in ipairs({ 'h', 'j', 'k', 'l' }) do
		local count = 0
		local timer = assert(vim.loop.new_timer())
		local map = key
		vim.keymap.set('n', key, function()
			if vim.v.count > 0 then
				count = 0
			end
			if count >= 7 then
				ok, id = pcall(vim.notify, 'Hold it Cowboy! 🤠', vim.log.levels.WARN, {
					replace = id,
					keep = function()
						return count >= 7
					end,
				})
				if not ok then
					id = nil
					return map
				end
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

return M
