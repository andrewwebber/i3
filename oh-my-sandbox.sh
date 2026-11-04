#!/usr/bin/bash

OPENAI_API_KEY=`pass platform.openai.com/andrew`

docker run --rm -it \
  -v "$(pwd):/workspace" \
  -v "$HOME/.agents:/home/agent/.agents" \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  -e CARGO_TERM_QUIET=true \
  pi-sandbox:latest "$@"
