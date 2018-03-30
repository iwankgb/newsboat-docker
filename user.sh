#!/bin/bash
set -e
USERID=${USERID:-1000}
GROUPID=${GROUPID:-1000}
USERNAME=${USERNAME:-newsboat}
groupadd -g ${GROUPID} ${USERNAME}
useradd -m -u ${USERID} -g ${GROUPID} ${USERNAME}
gosu ${USERID}:${GROUPID} /opt/newsboat/bin/newsboat
