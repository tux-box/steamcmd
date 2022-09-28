#!/bin/bash
if [ ! -f ${STEAMCMD_DIR}/steamcmd ]; then
    echo "SteamCMD not found!"
    echo steam steam/question select "I AGREE" | debconf-set-selections
    echo steam steam/license note '' | debconf-set-selections
    DEBIAN_FRONTEND=noninteractive apt-get install steamcmd -y
fi

echo "---Update SteamCMD---"
if [ "${USERNAME}" == "" ]; then
    ${STEAMCMD_DIR}/steamcmd \
    +login anonymous \
    +quit
else
    ${STEAMCMD_DIR}/steamcmd  \
    +login ${USERNAME} ${PASSWRD} \
    +quit
fi

while true
do
    sleep 1;
done
