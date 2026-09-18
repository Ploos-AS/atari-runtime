FROM debian:13-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG EMUTOS_VERSION=1.4
ARG EMUTOS_URL=https://downloads.sourceforge.net/project/emutos/emutos/1.4/emutos-512k-1.4.zip

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       unzip \
       hatari \
       xvfb \
    && rm -rf /var/lib/apt/lists/*


# EmuTOS is the free TOS-compatible ROM used for automated Atari qualification.
RUN set -eux; \
    mkdir -p /runtime/roms; \
    curl --fail --location --show-error --silent -o /tmp/emutos.zip "$EMUTOS_URL"; \
    unzip -q /tmp/emutos.zip -d /tmp/emutos; \
    rom="$(find /tmp/emutos -type f -name 'etos*.img' | head -n 1)"; \
    test -n "$rom"; \
    cp "$rom" /runtime/roms/emutos.img; \
    test -s /runtime/roms/emutos.img; \
    rm -rf /tmp/emutos /tmp/emutos.zip

WORKDIR /runtime

RUN mkdir -p /runtime/artifacts /runtime/config /runtime/roms /runtime/evidence
COPY tools /runtime/tools
RUN chmod +x /runtime/tools/*.sh

LABEL org.opencontainers.image.source="https://github.com/Ploos-AS/atari-runtime" \
      org.opencontainers.image.description="Ploos-AS standard Atari runtime and qualification environment"

CMD ["/runtime/tools/runtime-info.sh"]
