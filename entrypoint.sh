#!/bin/bash
set -e
source /usr/local/nvm/nvm.sh
source /usr/share/gazebo/setup.sh
cd /root/gzweb
gzserver --verbose & \
npm start
exec "$@"
