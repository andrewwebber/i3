require("codecompanion").setup({
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        show_result_in_chat = true, -- Show mcp tool results in chat
        make_vars = true, -- Convert resources to #variables
        make_slash_commands = true, -- Add prompts as /slash commands
      },
    },
  },
  strategies = {
    chat = {
      adapter = "custom",
    },
    inline = {
      adapter = "custom",
    },
    cmd = {
      adapter = "custom",
    },
  },
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:pass aistudio.google.com/deepc/gemini",
        },
      })
    end,
    custom = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "custom",
        env = {
          url = "http://127.0.0.1:11434",
          api_key = "ollama",
        },
        opts = {
          stream = false,
          tools = true,
          vision = false,
        },
        -- headers = {
        --   ["Content-Type"] = "application/json",
        -- },
        parameters = {
          sync = true,
        },
        schema = {
          model = {
            default = "awebber/coder",
          },
          -- num_ctx = {
          --   default = 16384,
          --   -- default = 8192,
          -- },
          -- num_predict = {
          --   default = -1,
          -- },
        },
      })
    end,
  },
})
