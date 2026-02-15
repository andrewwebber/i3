#! /bin/sh -xe
llama-server  -hf unsloth/Qwen3-4B-Instruct-2507-GGUF:Q4_K_M \
    --port 8012 \
    --jinja \
    -ngl 99 \
    -c 32000 \
    -fa on  \
    -b 512  --chat-template-kwargs "{\"enable_thinking\": false}"
    # --temp 0.1 \
    # --top-k 20 \
    # --top-p 0.95 \
    # --repeat-penalty 1.05 



