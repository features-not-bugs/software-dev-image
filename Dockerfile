FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm --needed \
    base-devel git nano openssl \
    bash bzip2 binutils bash-completion \
    curl diffutils grep gzip helm \
    jq kubectl lz4 openssh sqlite \
    sudo wget xz tar talosctl && \
    pacman -Scc --noconfirm

RUN useradd -m -u 1000 -s /bin/bash hayden && \
    echo "hayden ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/hayden
USER hayden

CMD ["sleep", "infinity"]