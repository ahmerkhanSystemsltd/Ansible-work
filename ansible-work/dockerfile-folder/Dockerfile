FROM ubuntu:latest

ARG USERNAME=docker
ARG USERPASS=docker
EXPOSE 22
RUN apt update && apt install openssh-server sudo whois -y
RUN useradd -ms /bin/bash $USERNAME

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#Creating the ssh directory and auth file for SSH
USER $USERNAME
RUN mkdir /home/$USERNAME/.ssh
COPY mycontainerkey.pub /home/$USERNAME/.ssh/authorized_keys

USER root
RUN chown $USERNAME /home/$USERNAME/.ssh/authorized_keys && \
        chmod 600 /home/$USERNAME/.ssh/authorized_keys
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#RUnning the entrypoint
CMD ["/entrypoint.sh"]
