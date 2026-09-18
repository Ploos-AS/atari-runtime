FROM debian:13-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       hatari \
       xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /runtime

RUN mkdir -p /runtime/artifacts /runtime/config /runtime/roms
COPY tools /runtime/tools
RUN chmod +x /runtime/tools/*.sh

LABEL org.opencontainers.image.source="https://github.com/Ploos-AS/atari-runtime" \
      org.opencontainers.image.description="Ploos-AS standard Atari runtime and qualification environment"

CMD ["/runtime/tools/runtime-info.sh"]
