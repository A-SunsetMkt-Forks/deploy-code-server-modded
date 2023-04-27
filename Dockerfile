# Start from the code-server Debian base image
FROM codercom/code-server:4.10.0

USER coder

# Apply VS Code settings
COPY deploy-container/settings.json .local/share/code-server/User/settings.json

# Use bash shell
ENV SHELL=/bin/bash

# Fix pip PATH warning
ENV PATH=/home/coder/.local/bin/:$PATH

# Install unzip + rclone (support for remote filesystem)
RUN sudo apt-get update && sudo apt-get install unzip -y
RUN curl https://rclone.org/install.sh | sudo bash

# Copy rclone tasks to /tmp, to potentially be used
COPY deploy-container/rclone-tasks.json /tmp/rclone-tasks.json

# Copy actboy168.tasks-0.9.0.vsix, will be installed in entrypoint.sh
COPY deploy-container/actboy168.tasks-0.9.0.vsix .local/share/code-server/User/actboy168.tasks-0.9.0.vsix

# Fix permissions for code-server
RUN sudo chown -R coder:coder /home/coder/.local

# You can add custom software and dependencies for your environment below
# -----------

# Install a VS Code extension:
# Note: we use a different marketplace than VS Code. See https://github.com/cdr/code-server/blob/main/docs/FAQ.md#differences-compared-to-vs-code
# RUN code-server --install-extension esbenp.prettier-vscode

# https://zhuanlan.zhihu.com/p/386285855
RUN /usr/bin/code-server --install-extension ms-python.python && \
    /usr/bin/code-server --install-extension eamodio.gitlens && \
    /usr/bin/code-server --install-extension alexcvzz.vscode-sqlite && \
    /usr/bin/code-server --install-extension luquedaniel.languague-renpy && \
    /usr/bin/code-server --install-extension equinusocio.vsc-material-theme && \
    /usr/bin/code-server --install-extension pkief.material-icon-theme && \
    /usr/bin/code-server --install-extension equinusocio.vsc-material-theme-icons && \
    /usr/bin/code-server --install-extension jeff-hykin.better-cpp-syntax && \
    /usr/bin/code-server --install-extension notskm.clang-tidy && \
    /usr/bin/code-server --install-extension xaver.clang-format && \
    /usr/bin/code-server --install-extension llvm-vs-code-extensions.vscode-clangd && \
    /usr/bin/code-server --install-extension twxs.cmake && \
    /usr/bin/code-server --install-extension ms-vscode.cmake-tools && \
    /usr/bin/code-server --install-extension vadimcn.vscode-lldb && \
    /usr/bin/code-server --install-extension ms-toolsai.jupyter && \
    /usr/bin/code-server --install-extension ms-toolsai.jupyter-keymap && \
    /usr/bin/code-server --install-extension ms-toolsai.jupyter-renderers && \
    /usr/bin/code-server --install-extension yzhang.markdown-all-in-one && \
    /usr/bin/code-server --install-extension redhat.vscode-yaml && \
    /usr/bin/code-server --install-extension jock.svg && \
    /usr/bin/code-server --install-extension MS-CEINTL.vscode-language-pack-zh-hans && \
    /usr/bin/code-server --install-extension formulahendry.code-runner && \
    /usr/bin/code-server --install-extension GitHub.vscode-pull-request-github && \
    /usr/bin/code-server --install-extension ritwickdey.LiveServer && \
    /usr/bin/code-server --install-extension redhat.vscode-xml && \
    /usr/bin/code-server --install-extension cweijan.vscode-office

# Install apt packages:
# RUN sudo apt-get install -y ubuntu-make

RUN sudo apt-get install -y \
    net-tools \
    locales \
    vim \
    wget \
    bash-completion \
    python3 \
    python3-pip \
    python3-setuptools \
    build-essential \
    python3-dev \
    libssl-dev \
    libffi-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    sqlite3 \
    cmake \
    zlib1g-dev \
    iputils-ping \
    ssh \
    nmap \
    iputils-tracepath \
    iputils-arping \
    iputils-clockdiff \
    traceroute \
    git-svn \
    clang \
    sl \
    java-common \
    default-jre \
    default-jdk \
    ffmpeg \
    llvm \
    gdb \
    tcptraceroute

RUN /usr/bin/python3 -m pip install -U pip setuptools
RUN /usr/bin/python3 -m pip install requests httpx scrapy aiohttp pyquery beautifulsoup4 \
  selenium pyppeteer pylint flask django tornado numpy pandas scipy autopep8 faker httpie lxml

# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
#         ~/.fzf/install

# https://github.com/deluan/zsh-in-docker
# Default powerline10k theme, no plugins installed
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"


# Copy files: 
# COPY deploy-container/myTool /home/coder/myTool

COPY deploy-container/myTool /home/coder/myTool

# Apply Chinese once Chinese language pack is installed
COPY deploy-container/argv.json .local/share/code-server/User/argv.json

# -----------

# Port
ENV PORT=8080

# Use our custom entrypoint script first
COPY deploy-container/entrypoint.sh /usr/bin/deploy-container-entrypoint.sh
ENTRYPOINT ["/usr/bin/deploy-container-entrypoint.sh"]
