FROM almalinux:9
RUN dnf install nginx -y
# root access required for roboshop user to install packages
RUN useradd roboshop 

USER roboshop
CMD ["sleep","100"]
