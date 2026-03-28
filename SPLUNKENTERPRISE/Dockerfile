# Install redhat9 base OS
FROM redhat/ubi9

# Install required dependencies
RUN dnf install -y procps && dnf clean all

# Set environment variables for automated setup
ENV SPLUNK_HOME=/opt/splunk
	
	
# Download splunkfowarder package from splunk site
ADD "https://download.splunk.com/products/splunk/releases/10.2.0/linux/splunk-10.2.0-d749cb17ea65.x86_64.rpm" /opt/

# Install the rpm package and enable systemd-managed service 
RUN rpm -ivh /opt/splunk-10.2.0-d749cb17ea65.x86_64.rpm
RUN ${SPLUNK_HOME}/bin/splunk enable boot-start -systemd-managed 1 -user splunk -group splunk
RUN ${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --no-prompt
RUN chown -R splunk:splunk /opt/splunk

# Expose management port (default: 8089)
EXPOSE 8000 8089