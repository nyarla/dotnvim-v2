FROM archlinux:base-devel

ARG UID
ARG GID
ARG NAME
ARG GROUP
ARG HOME

RUN \
      (groupdel $GROUP || true) \
  &&   groupadd -g $GID $GROUP \
  &&   useradd -d $HOME -g $GID -m $NAME \
  &&   echo "$NAME ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$NAME

RUN \
    mkdir -p $HOME/.local/state/nvim/shada && chown $UID:$GID $HOME/.local/state/nvim/shada \
&&  mkdir -p $HOME/.config  && ln -sf /data/config  $HOME/.config/nvim \
&&  mkdir -p $HOME/.local   && ln -sf /data/local   $HOME/.local/share

RUN pacman -Syu --noconfirm

ENV YAY_VERSION 11.3.1
ENV YAY_ARCH x86_64

RUN   cd /tmp \
  &&  curl -L https://github.com/Jguer/yay/releases/download/v${YAY_VERSION}/yay_${YAY_VERSION}_${YAY_ARCH}.tar.gz \
    | tar -zxvf - -C . yay_${YAY_VERSION}_${YAY_ARCH}/yay \
  && mv yay_${YAY_VERSION}_${YAY_ARCH}/yay /usr/bin/yay && chmod +x /usr/bin/yay \
  && rm -d yay_${YAY_VERSION}_${YAY_ARCH}

USER $UID:$GID

RUN yay -S --noconfirm \
  git neovim unzip \
  \
  nodejs npm deno \
  go \
  nixfmt rnix-lsp

RUN sudo rm /etc/sudoers.d/$NAME

ENTRYPOINT ["/bin/bash"]
