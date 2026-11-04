FROM 229488270794.dkr.ecr.eu-central-1.amazonaws.com/rust-ci:cec3c2b8

WORKDIR /workspace
ENV PATH="/home/builduser/.local/bin:$PATH"

# 3. Install pi-bolt as the agent user
RUN curl -fsSL https://pi-bolt.opensec.in/install.sh | PIBOLT_EXTENSIONS=true PIBOLT_YES=1 sh
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN uv tool install graphifyy
RUN graphify install pi

ENTRYPOINT ["pi-bolt"]
