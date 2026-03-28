#!/bin/bash
set -e

# Accept license and start Splunk Universal Forwarder
/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt

# Keep container running
tail -f /opt/splunkforwarder/var/log/splunk/splunkd.log