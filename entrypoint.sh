#!/bin/bash
set -e

# Start SSH daemon
/usr/sbin/sshd

# Run the main command
exec "sleep infinity"