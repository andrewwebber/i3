#! /bin/sh -e
function thinking(){
  llama-server  -hf unsloth/Qwen3.5-35B-A3B-GGUF:Q4_K_M\
      --port 8012 \
      --jinja \
      -ngl 32 \
      -c 132000 \
      --flash-attn on  \
      -b 512  \
      --temp 1.1 \
      --top-k 40 \
      --top-p 0.95 \
      --repeat-penalty 1.05 
      # -cmoe 
      # -fit
      # --chat-template-kwargs "{\"enable_thinking\": false}"
}

function coding(){
  llama-server  -hf unsloth/Qwen3-Coder-Next-GGUF:MXFP4_MOE\
      --port 8012 \
      --jinja \
      -ngl 32 \
      -c 132000 \
      --flash-attn on  \
      -b 512  \
      --temp 1.1 \
      --top-k 40 \
      --top-p 0.95 \
      --repeat-penalty 1.05 
}

function small(){
  llama-server  -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_M\
      --port 8012 \
      --jinja \
      -ngl 99 \
      -c 132000 \
      --flash-attn on  \
      -b 512  \
      --temp 1.1 \
      --top-k 40 \
      --top-p 0.95 \
      --repeat-penalty 1.05 \
      -cmoe \
      -fit on
}

opt=$1
case $opt
in
    s) small ;;
    c) coding ;;
    t) thinking ;;
    *) echo "Nothing to do"
       exit ;;
esac
