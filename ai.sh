#! /bin/sh -xe
LLAMA_ROCM_VMM=1
function thinking(){
# unsloth/Qwen3.5-35B-A3B-GGUF:UD-Q4_K_XL
  llama-server  -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_XL\
      --port 8012 \
      --jinja \
      -ngl 999 \
      -c 64000 \
      --flash-attn on  \
      -b 512  \
      --temp 0.6 \
      --top-k 20 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.0 \
      --cache-type-k q4_0 --cache-type-v q4_0 \
      --reasoning-budget -1 \
      --chat-template-kwargs "{\"enable_thinking\": true}"
      # --reasoning-budget 0 --chat-template-kwargs "{\"enable_thinking\": false}"
      # -cmoe 
      # -fit
      # --chat-template-kwargs "{\"enable_thinking\": false}"
}

function coding(){
    # unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M
  llama-server -hf unsloth/Qwen3-Coder-Next-GGUF:UD-Q2_K_XL \
      --port 8012 \
      --jinja \
      -ngl 999 \
      -c 32768 \
      --flash-attn on \
      -b 512 \
      --ubatch-size 1024 \
      --temp 1.0 \
      --top-k 40 \
      --top-p 0.95 \
      --min-p 0.01 \
      --repeat-penalty 1.0 \
      --cache-type-k q4_0 --cache-type-v q4_0 
      #--reasoning-budget 0 \
      #--tool-call-parser qwen3_coder
      #-fit on
}

function fim(){
    # unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M
  llama-server  -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_XL\
      --port 8012 \
      --jinja \
      -ngl 999 \
      -c 64000 \
      --flash-attn on  \
      -b 512  \
      --temp 0.6 \
      --top-k 20 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.0 \
      --reasoning-budget 1024 \
      --cache-type-k q4_0 --cache-type-v q4_0 \
      --reasoning-budget 0 --chat-template-kwargs "{\"enable_thinking\": false}"
      #-fit on
}

function server(){
    # unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M
  llama-server  \
      --port 8012 \
      --jinja \
      -ngl 999 \
      -c 132000 \
      --flash-attn on  \
      -b 2048  \
      --no-mmap \
      --temp 0.7 \
      --top-k 40 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.05 \
      --cache-type-k q8_0 --cache-type-v q8_0 
      #-fit on
}

function small(){

# gfx1032
ROCR_VISIBLE_DEVICES="0,1" DRI_PRIME=1 HSA_OVERRIDE_GFX_VERSION=10.3.0 llama-server  -hf unsloth/Qwen3.5-9B-GGUF:Q8_0\
      --port 8012 \
      --jinja \
      -c 16384 \
      -ngl 99 \
      --split-mode layer \
      --flash-attn on \
      --temp 0.3 \
      --top-k 40 \
      --top-p 0.95 \
      --min-p 0.05 \
      --repeat-penalty 1.05 \
      --cache-type-k q8_0 --cache-type-v q8_0 \
      --reasoning-budget 0 --chat-template-kwargs "{\"enable_thinking\": false}" 
}


opt=$1
case $opt
in
    small) small ;;
    coding) coding ;;
    thinking) thinking ;;
    fim) fim ;;
    server) server ;;
    *) echo "Nothing to do"
       exit ;;
esac
