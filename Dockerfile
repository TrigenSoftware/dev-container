FROM ubuntu:25.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    build-essential \
    libssl-dev \
    zsh \
    locales \
    ca-certificates \
    gnupg \
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
