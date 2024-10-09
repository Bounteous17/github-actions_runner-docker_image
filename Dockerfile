FROM ubuntu:24.10

RUN apt update
RUN apt install -y nodejs sudo curl tar docker.io unzip wget

COPY install-aws-cli.sh .
RUN ./install-aws-cli.sh

COPY install-kubectl.sh .
RUN ./install-kubectl.sh

RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
ENV PNPM_HOME="/home/runner/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"