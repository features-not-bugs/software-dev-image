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

RUN sudo -u hayden git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && \
    cd /tmp/yay-bin && \
    sudo -u hayden makepkg -si --noconfirm && \
    rm -rf /tmp/yay-bin

RUN sudo -u hayden yay -S --noconfirm tini && \
    sudo -u hayden yay -Scc --noconfirm

RUN ssh-keygen -A

WORKDIR /home/hayden

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/sbin/sshd", "-D"]