FROM summerwind/actions-runner:latest AS customize

RUN wget https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-arm64.tar.xz -O /tmp/node-v20.15.1-linux-arm64.tar.xz
RUN sudo tar -xf /tmp/node-v20.15.1-linux-arm64.tar.xz -C /tmp && ls -l /tmp/node-v20.15.1-linux-arm64
RUN sudo cp -r /tmp/node-v20.15.1-linux-arm64/lib /usr
RUN sudo cp -r /tmp/node-v20.15.1-linux-arm64/share /usr
RUN sudo cp -r /tmp/node-v20.15.1-linux-arm64/include /usr
RUN sudo cp -r /tmp/node-v20.15.1-linux-arm64/bin /usr

RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
ENV PNPM_HOME="/home/runner/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"