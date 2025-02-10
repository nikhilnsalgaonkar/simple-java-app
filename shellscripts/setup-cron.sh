#!/bin/bash

# Path of gitlog.sh script
SCRIPT_PATH="~/shell-scripts/gitlog.sh"

CRONJOB="0 15 * * * $SCRIPT_PATH"

crontab -l | grep -Fxq "$CRONJOB"
if [ $? -eq 0 ]; then
  echo "Cron job already exists."
else
  (crontab -l 2>/dev/null; echo "$CRONJOB") | crontab -
  echo "Cron job added successfully: $CRONJOB"
fi