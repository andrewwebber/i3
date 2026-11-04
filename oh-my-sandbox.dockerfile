FROM node:latest

# Install essential CLI tools the agent might rely on (git, curl, build tools)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*


# 1. Create the non-root user first
RUN useradd -ms /bin/bash agent

# 2. Switch to the agent user so the installer writes to /home/agent/.local/bin
USER agent
WORKDIR /workspace
ENV PATH="/home/agent/.local/bin:$PATH"

# 3. Install pi-bolt as the agent user
RUN curl -fsSL https://pi-bolt.opensec.in/install.sh | PIBOLT_EXTENSIONS=true PIBOLT_YES=1 sh
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN uv tool install graphifyy
RUN graphify install pi

ENTRYPOINT ["pi-bolt"]
