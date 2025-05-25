require("codecompanion").setup({
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
    custom = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "custom",
        env = {
          url = "http://127.0.0.1:11434",
          api_key = "OLLAMA_API_KEY",
        },
        headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer ${api_key}",
        },
        parameters = {
          sync = true,
        },
        schema = {
          model = {
            default = "llama3.1:8b",
          },
          num_ctx = {
            -- default = 16384,
            default = 8192,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
})
