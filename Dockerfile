FROM archlinux:base-devel

ARG UID
ARG GID
ARG NAME
ARG GROUP
ARG HOME

RUN \
      (groupdel $GROUP || true) \
  &&   groupadd -g $GID $GROUP \
  &&   useradd -d $HOME -g $GID -m $NAME

RUN   pacman -Syu --noconfirm \
  &&  pacman -S --noconfirm \
        git neovim unzip \
        \
        nodejs \
        npm \
        \
        go

RUN \
    mkdir -p $HOME/.local/state/nvim/shada && chown $UID:$GID $HOME/.local/state/nvim/shada \
&&  mkdir -p $HOME/.config  && ln -sf /data/config  $HOME/.config/nvim \
&&  mkdir -p $HOME/.local   && ln -sf /data/local   $HOME/.local/share

ENTRYPOINT ["/bin/bash"]
