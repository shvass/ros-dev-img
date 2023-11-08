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

# make copy of home dir
COPY ./home/ /home/${USRNAME}/


# install gazebo
RUN curl -sSL http://get.gazebosim.org | sh

# install additional packages
RUN apt-get install ros-humble-gazebo-ros-pkgs ros-humble-joint-state-publisher

ENTRYPOINT [ "/bin/bash", "/ros_entrypoint.sh" ]
CMD [ "/bin/bash" ]