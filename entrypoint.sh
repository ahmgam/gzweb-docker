#!/bin/bash
set -e
source /usr/local/nvm/nvm.sh
source /usr/share/gazebo/setup.sh
cd /root/gzweb
npm run deploy --- -m
gzserver --verbose & \
npm start
exec "$@"
