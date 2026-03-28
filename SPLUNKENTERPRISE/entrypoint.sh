#!/bin/bash
set -e

/opt/splunk/bin/splunk start \
  --accept-license \
  --answer-yes \
  --no-prompt \
  --run-as-root

# Keep container alive
tail -f /opt/splunk/var/log/splunk/splunkd.log