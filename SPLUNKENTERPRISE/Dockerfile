# Install redhat9 base OS
FROM redhat/ubi9

# Install required dependencies
RUN dnf install -y procps && dnf clean all && dnf install python -y

# Set environment variables for automated setup
ENV SPLUNK_HOME=/opt/splunk
	
	
# Download splunkfowarder package from splunk site
ADD "https://download.splunk.com/products/splunk/releases/10.2.0/linux/splunk-10.2.0-d749cb17ea65.x86_64.rpm" /opt/

# Install the rpm package and enable systemd-managed service 
RUN rpm -ivh /opt/splunk-10.2.0-d749cb17ea65.x86_64.rpm


# Copy entrypoint
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh
RUN chown -R splunk:splunk /opt/splunk

# Expose management port (default: 8089)
EXPOSE 8000 8089

# Start Splunk Universal Forwarder
CMD ["/sbin/entrypoint.sh"]