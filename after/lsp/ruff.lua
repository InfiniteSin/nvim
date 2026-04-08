-- ~/.config/nvim/lsp/ruff.lua
-- Native Neovim LSP config for Ruff (linter + formatter)
-- https://docs.astral.sh/ruff/editors/setup/

return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  init_options = {
    settings = {
      -- Enable fix-all on save
      fixAll = true,

	  configurationPreference = 'editorFirst',

	  exclude = {
		  'tests',
		  ".bzr",
	    ".direnv",
	    ".eggs",
	    ".git",
	    ".git-rewrite",
	    ".hg",
	    ".ipynb_checkpoints",
	    ".mypy_cache",
	    ".nox",
	    ".pants.d",
	    ".pyenv",
	    ".pytest_cache",
	    ".pytype",
	    ".ruff_cache",
	    ".svn",
	    ".tox",
	    ".venv",
	    ".vscode",
	    "__pypackages__",
	    "_build",
	    "buck-out",
	    "build",
	    "dist",
	    "node_modules",
	    "site-packages",
	    "venv",
		},

	  lineLength = 88,
	
		-- Enable import organization
		organizeImports = true,

	  configuration = {
			lint = {
				select = {
				  "E",   -- pycodestyle errors
				  "W",   -- pycodestyle warnings
				  "F",   -- pyflakes
				  "I",   -- isort
				  "B",   -- flake8-bugbear
				  "C4",  -- flake8-comprehensions
				  "UP",  -- pyupgrade
				},
				ignore = {
					"E501",	-- line too long (handled by formatter)
				},
			},
			format = {
				['quote-style'] = 'single',
		    },
		},

      -- Code actions
      codeAction = {
        disableRuleComment = {
          enable = true,
        },
        fixViolation = {
          enable = true,
        },
      },

      -- Log level: "off" | "error" | "warn" | "info" | "debug" | "trace"
      logLevel = "warn",
    },
  },
}
