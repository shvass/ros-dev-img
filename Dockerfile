FROM osrf/ros:humble-desktop-full


# set arguments
ARG USRNAME=aksh
ARG UID=1000
ARG GID=${UID}

# setup username
RUN groupadd --gid ${GID} ${USRNAME} \
    && useradd -s /bin/bash --uid ${UID} --gid ${GID} -m ${USRNAME} \
    && mkdir /home/${USRNAME}/.config && chown ${UID}:${GID} /home/${USRNAME}/.config


#  enable sudo permissions
RUN echo "aksh ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


COPY ./rootDir/ /
COPY ./home/ /home/${USRNAME}/


ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
CMD [ "/bin/bash" ]