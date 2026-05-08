FROM ubuntu:25.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    bubblewrap \
    build-essential \
    libssl-dev \
    zsh \
    locales \
    ca-certificates \
    gnupg \
    nano \
    htop \
    psmisc \
    libglib2.0-0t64 \
    libnss3 \
    libnspr4 \
    libatk1.0-0t64 \
    libatk-bridge2.0-0t64 \
    libatspi2.0-0t64 \
    libcups2t64 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcb-randr0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-render0 \
    libxcb-shm0 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2t64 \
    libfontconfig1 \
    libfreetype6 \
    fonts-liberation \
    fonts-noto-color-emoji \
    fonts-freefont-ttf \
    fonts-ipafont-gothic \
    fonts-tlwg-loma-otf \
    fonts-unifont \
    fonts-wqy-zenhei \
    xfonts-cyrillic \
    xfonts-scalable \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Locale configuration
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ADD scripts /scripts

# Install Oh My Zsh
RUN sh /scripts/ohmyzsh-install.sh

# Set up variables
RUN echo 'source /scripts/vars.sh' >> ~/.zshrc

# Install asdf
RUN sh /scripts/asdf-install.sh

# Set zsh as default shell
ENV SHELL=/bin/zsh

WORKDIR /workspace

CMD ["zsh"]
