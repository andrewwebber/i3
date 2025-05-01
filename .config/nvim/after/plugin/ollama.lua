require("gen").prompts["Analysis"] = {
  prompt = "Use the following pieces of context to answer the question at the end. If you don't know the answer, just say that you don't know, don't try to make up an answer.\n\n$input\n\nQuestion: $text\nHelpful Answer:",
  replace = false,
  model = "deepseek-coder:8b",
}

require("gen").prompts["Coder_Review_Code"] = {
  prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
  model = "deepseek-coder:8b",
}

require("gen").prompts["Coder_Enhance_Code"] = {
  prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```",
  model = "deepseek-coder:8b",
}
