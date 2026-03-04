#! /bin/sh -e
function thinking(){
# unsloth/Qwen3.5-35B-A3B-GGUF:Q4_K_M
  llama-server  -hf unsloth/Qwen3.5-35B-A3B-GGUF:UD-Q4_K_XL\
      --port 8012 \
      --jinja \
      -ngl 99 \
      -c 132000 \
      --flash-attn on  \
      -b 512  \
      --temp 0.7 \
      --top-k 40 \
      --top-p 0.8 \
      --min-p 0.05 \
      --cache-type-k q8_0 --cache-type-v q8_0 \
      --repeat-penalty 1.05 \
      --reasoning-budget -1 
      # --reasoning-budget 0 --chat-template-kwargs "{\"enable_thinking\": false}"
      # -cmoe 
      # -fit
      # --chat-template-kwargs "{\"enable_thinking\": false}"
}

function coding(){
  llama-server  -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M\
      --port 8012 \
      --jinja \
      -c 132000 \
      --flash-attn on  \
      -b 2048  \
      --no-mmap \
      --temp 0.3 \
      --top-k 40 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.05 \
      --cache-type-k q8_0 --cache-type-v q8_0 \
      -fit on
}

function small(){

# gfx1032
HSA_OVERRIDE_GFX_VERSION=10.3.0 llama-server  -hf unsloth/Qwen3.5-9B-GGUF:Q6_K\
      --port 8012 \
      --jinja \
      -c 2000 \
      --flash-attn on  \
      --temp 0.3 \
      --top-k 40 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.05 \
      -fit on
}


opt=$1
case $opt
in
    small) small ;;
    coding) coding ;;
    thinking) thinking ;;
    *) echo "Nothing to do"
       exit ;;
esac
