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

RUN   (test -d $HOME/.config || ln -sf /data/config $HOME/.config) \
  &&  (test -d $HOME/.local  || ln -sf /data/local $HOME/.local)

ENTRYPOINT ["/bin/bash"]
