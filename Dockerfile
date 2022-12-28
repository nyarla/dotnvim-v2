FROM archlinux:base-devel

ARG UID
ARG GID
ARG NAME
ARG GROUP
ARG HOME

# install yay package manager
ENV YAY_VERSION 11.3.1
ENV YAY_ARCH x86_64

RUN   cd /tmp \
  &&  curl -L https://github.com/Jguer/yay/releases/download/v${YAY_VERSION}/yay_${YAY_VERSION}_${YAY_ARCH}.tar.gz \
    | tar -zxvf - -C . yay_${YAY_VERSION}_${YAY_ARCH}/yay \
  && mv yay_${YAY_VERSION}_${YAY_ARCH}/yay /usr/bin/yay && chmod +x /usr/bin/yay \
  && rm -d yay_${YAY_VERSION}_${YAY_ARCH}

# add user and group
RUN \
      (groupdel $GROUP || true) \
  &&   groupadd -g $GID $GROUP \
  &&   useradd -d $HOME -g $GID -m $NAME \
  &&   echo "$NAME ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$NAME

# setup files and directories
RUN \
    mkdir -p $HOME/.local/state/nvim/shada \
&&  mkdir -p $HOME/.config/efm-langserver \
&&  mkdir -p $HOME/.config/textlint \
&&  chown $UID:$GID -R $HOME/.local $HOME/.config \
\
&&  mkdir -p $HOME/.config  && ln -sf /data/config  $HOME/.config/nvim \
&&  mkdir -p $HOME/.local   && ln -sf /data/local   $HOME/.local/share

RUN chown -R $UID:$GID $HOME/.config

# install packages
USER $UID:$GID

RUN sudo pacman -Syu --needed --noconfirm \
&&  yay -Syu --noconfirm \
    git neovim unzip \
    \
    nodejs npm deno \
    go \
    nixfmt rnix-lsp \
    \
&&  rm -rf $HOME/.cabal $HOME/.cache $HOME/.cargo \
&&  sudo rm /etc/sudoers.d/$NAME

COPY files/package.json $HOME/.config/textlint/package.json
COPY files/efm-langserver/config.yaml $HOME/.config/efm-langserver/config.yaml

RUN cd $HOME/.config/textlint && npm install

ENV PATH $HOME/.config/textlint/node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
ENTRYPOINT ["/bin/bash"]
