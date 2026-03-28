# Install redhat9 base OS
FROM redhat/ubi9

# Set environment variables for automated setup
ENV SPLUNK_START_ARGS=--accept-license \
    SPLUNK_PASSWORD=changeme123 \
    SPLUNK_USER=splunkfwd
	
# Download splunkfowarder package from splunk site
ADD "https://download.splunk.com/products/universalforwarder/releases/9.4.9/linux/splunkforwarder-9.4.9-03bb451d4e07.x86_64.rpm" /opt/

# Install the rpm package 
RUN rpm -ivh /opt/splunkforwarder-9.4.9-03bb451d4e07.x86_64.rpm

# COPY configs
COPY ./configs/ /opt/splunkforwarder/etc/system/local/

# Copy entrypoint
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

# Expose management port (default: 8089)
EXPOSE 8089

# Start Splunk Universal Forwarder
CMD ["/sbin/entrypoint.sh"]