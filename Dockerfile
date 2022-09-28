FROM tuxbox1/base-container
#sets up and installs steamCMD

MAINTAINER tux-box <nathan.flow@gmail.com>

ENV DATA_DIR="/serverdata"
ENV STEAMCMD_DIR="/usr/games"
ENV SERVER_DIR="${DATA_DIR}/serverfiles"
ENV GAME_ID="template"
ENV GAME_NAME="template"
ENV GAME_PARAMS="template"
ENV GAME_PORT=27015
ENV VALIDATE=""
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USERNAME=""
ENV PASSWRD=""
ENV USER="steam"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && \
        mkdir $SERVER_DIR && \
        useradd -d $DATA_DIR -s /bin/bash $USER && \
        chown -R $USER $DATA_DIR && \
        ulimit -n 2048

ADD /scripts/ /scripts
RUN chmod -R 770 /scripts/

#proccess work.
ENTRYPOINT ["/scripts/proccessWork.sh"]

