#!/bin/bash

REPOURL="https://github.com/nikhilnsalgaonkar/simple-java-app.git"
WORKDIR="/tmp/simple-java-app"
LOGDIR="/tmp"
DATE=$(date +%d%m%y)
LOGFILE="$LOGDIR/gitlog_$DATE.log"

# Clone the git repo
git clone $REPOURL $WORKDIR

cd $WORKDIR

# Show the last 5 commits author and modified files
git log -n 5 --pretty=format:"Author: %an%nModified files:%n" --name-only > $LOGFILE

# Delete the repository
rm -rf $WORKDIR