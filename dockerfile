# Use the official minimal Ubuntu base image
FROM ubuntu:latest

# Update the package list and install nginx, python3, and openssh-server
RUN apt-get update && \
    apt-get install -y nginx python3 python3-pip openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Enable ssh access on this container
RUN echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd

# Expose ports for nginx and ssh
EXPOSE 80
EXPOSE 22

# Start nginx and ssh services
CMD service ssh start && nginx -g 'daemon off;'