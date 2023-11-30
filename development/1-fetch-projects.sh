#!/bin/bash
echo "T2 Development script"
echo "STEP 1- Cloning projects..."

export GIT_PREFIX=https://github.com/twit2
export PROJECTS=(std-library svc-users svc-auth svc-posts frontend)

if [ "%1" == "--ssh" ]; then
    echo Fetching projects using SSH...
    GIT_PREFIX=git@github.com:twit2
else
    echo Fetching projects using HTTPS...
fi;

# Process project pulls
for t in ${PROJECTS[@]}; do
    if [ -d projects/$t ]; then
        echo "Project '$t' exists, syncing changes..."
        cd projects/$t
        git pull
        cd ..
    else
        echo "Project '$t' has not been cloned - cloning now..."
        git clone $GIT_PREFIX/$t.git projects/$t
    fi;
done