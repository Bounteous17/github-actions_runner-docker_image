FROM ubuntu:24.10

RUN apt update
RUN apt install -y nodejs sudo curl tar docker.io unzip

COPY install-aws-cli.sh .
RUN ./install-aws-cli.sh

RUN curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/arm64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
ENV PNPM_HOME="/home/runner/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"