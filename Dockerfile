FROM centos:latest

RUN yum update -y
RUN yum install -y passwd openssh openssh-server openssh-clients sudo 
## Create user
RUN useradd vagrant
RUN passwd -f -u vagrant
## Set up SSH 
RUN mkdir -p /home/vagrant/.ssh; chown vagrant /home/vagrant/.ssh; chmod 700 /home/vagrant/.ssh
ADD  authorized_keys /home/vagrant/.ssh/authorized_keys
 
RUN chown vagrant /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys
## setup sudoers
RUN echo "vagrant    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker

## Set up SSHD config
 
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop
CMD /usr/sbin/sshd -D
EXPOSE 22
