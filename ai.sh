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
      --top-k 20 \
      --top-p 0.8 \
      --min-p 0.0 \
      --cache-type-k f16 --cache-type-v f16 \
      --repeat-penalty 1.05 \
      --reasoning-budget 0 --chat-template-kwargs "{\"enable_thinking\": false}"
      # -cmoe 
      # -fit
      # --chat-template-kwargs "{\"enable_thinking\": false}"
}

function coding(){
  llama-server  -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M\
      --port 8012 \
      --jinja \
      -ngl 99 \
      -c 132000 \
      --flash-attn on  \
      -b 512  \
      --temp 1.1 \
      --top-k 20 \
      --top-p 0.95 \
      --repeat-penalty 1.05 \
      --cache-type-k q4_0 --cache-type-v q4_0 \
      -cmoe \
      -fit on
}

opt=$1
case $opt
in
    coding) coding ;;
    thinking) thinking ;;
    *) echo "Nothing to do"
       exit ;;
esac
