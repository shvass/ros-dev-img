FROM osrf/ros:humble-desktop-full


# set arguments
ARG USRNAME=rosdev
ARG UID=1000
ARG GID=${UID}

# setup username
RUN groupadd --gid ${GID} ${USRNAME} \
    && useradd -s /bin/bash --uid ${UID} --gid ${GID} -m ${USRNAME} \
    && mkdir /home/${USRNAME}/.config && chown ${UID}:${GID} /home/${USRNAME}/.config


#  enable sudo permissions
RUN echo "rosdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


COPY ./home/ /home/${USRNAME}/


RUN curl -sSL http://get.gazebosim.org | sh

ENTRYPOINT [ "/bin/bash", "/ros_entrypoint.sh" ]
CMD [ "/bin/bash" ]