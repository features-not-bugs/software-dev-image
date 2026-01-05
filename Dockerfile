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

RUN ssh-keygen -A

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /home/hayden

ENTRYPOINT ["/entrypoint.sh"]
