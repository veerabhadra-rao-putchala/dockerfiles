#!/bin/bash
set -e

${SPLUNK_HOME}/bin/splunk stop
${SPLUNK_HOME}/bin/splunk disable boot-start
${SPLUNK_HOME}/bin/splunk enable boot-start -systemd-managed 1 -user splunk -group splunk
${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --no-prompt
# Keep container alive
tail -f /opt/splunk/var/log/splunk/splunkd.log