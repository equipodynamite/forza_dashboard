#!/bin/bash
set -e

# Remove potentially pre-existing server.pid to avoid 'Rails server already running' issues.
rm -f /app/tmp/pids/server.pid

# Execute main process
exec "$@"
