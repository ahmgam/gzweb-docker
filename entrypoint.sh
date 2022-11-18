#!/bin/bash
set -e

source /usr/share/gazebo/setup.sh
npm run deploy --- -m

gzserver --verbose & \
npm start

exec "$@"