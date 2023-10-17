return {
	enabled = false,
	'epwalsh/obsidian.nvim',
	lazy = true,
	event = {
		'BufReadPre ' .. vim.fn.expand('~') .. '/zet/**.md',
		'BufNewFile ' .. vim.fn.expand('~') .. '/zet/**.md',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('obsidian').setup({
			dir = '~/zet',
			notes_subdir = 'notes',
			log_level = vim.log.levels.DEBUG,

			daily_notes = {
				folder = 'notes/dailies',
				date_format = '%Y-%m-%d',
				alias_format = '%B %-d, %Y',
				template = nil,
			},

			completion = {
				nvim_cmp = true,
				min_chars = 2,
				--  * "current_dir" - put new notes in same directory as the current buffer.
				--  * "notes_subdir" - put new notes in the default notes subdirectory.
				new_notes_location = 'current_dir',

				-- Whether to add the output of the node_id_func to new notes in autocompletion.
				-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
				prepend_note_id = true,
			},

			mappings = {
				['<leader>zz'] = {
					action = function()
						return require('obsidian').util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
			},

			-- Optional, if set to true, the specified mappings in the `mappings`
			-- table will overwrite existing ones. Otherwise a warning is printed
			-- and the mappings are not applied.
			overwrite_mappings = false,

			-- Optional, customize how names/IDs for new notes are created.
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ''
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. '-' .. suffix
			end,
			disable_frontmatter = false,

			note_frontmatter_func = function(note)
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }
				if note.metadata ~= nil and require('obsidian').util.table_length(note.metadata) > 0 then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			templates = {
				subdir = 'templates',
				date_format = '%Y-%m-%d',
				time_format = '%H:%M',
				substitutions = {},
			},
			backlinks = {
				height = 10,
				wrap = true,
			},

			follow_url_func = function(url)
				vim.fn.jobstart({ 'open', url })
			end,

			use_advanced_uri = true,
			open_app_foreground = false,
			finder = 'telescope.nvim',
			sort_by = 'modified',
			sort_reversed = true,
			open_notes_in = 'current',
		})
	end,
}
