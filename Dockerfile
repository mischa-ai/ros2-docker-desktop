FROM osrf/ros:iron-desktop-full

RUN apt-get update \
    && apt-get install -y vim \
    && rm -rf /var/lib/apt/list/*

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]

CMD [ "bash" ]