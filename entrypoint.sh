#!/bin/bash
set -e

/usr/sbin/sshd -D -e &
exec opencode web