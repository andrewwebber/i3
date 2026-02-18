#! /bin/sh -xe
llama-server  -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M \
    --port 8012 \
    --jinja \
    -ngl 99 \
    -c 32000 \
    -fa on  \
    -b 512  \
    --temp 0.1 \
    --top-k 20 \
    --top-p 0.95 \
    --repeat-penalty 1.05 
    # --chat-template-kwargs "{\"enable_thinking\": false}"




