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

return M
