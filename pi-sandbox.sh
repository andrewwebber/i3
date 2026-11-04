#!/usr/bin/bash

OPENAI_API_KEY=`pass platform.openai.com/andrew`

docker run --rm -it --net=host \
  -v "$(pwd):/workspace" \
  -v "$HOME/.agents:/home/agent/.agents" \
  --cap-drop=ALL --security-opt=no-new-privileges --pids-limit=512 \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  -e CARGO_TERM_QUIET=true \
  pi-sandbox:latest "$@"
