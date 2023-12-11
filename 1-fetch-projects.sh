#!/bin/bash
echo "T2 Development script"
echo "STEP 1- Cloning projects..."
echo "---------------------------"

export GIT_PREFIX=https://github.com/twit2
export PROJECTS=(std-library svc-users svc-auth svc-posts svc-cdn frontend admin-frontend std-library-fe)

if [ "$1" == "--ssh" ]; then
    echo Fetching projects using SSH...
    GIT_PREFIX=git@github.com:twit2
else
    echo Fetching projects using HTTPS...
fi;

# Process projects
for t in ${PROJECTS[@]}; do
    if [ -e projects/$t ]; then
        echo "Project '$t' exists, syncing changes..."
        #mv projects/$t/__gitstrip projects/$t/.git
        cd projects/$t
        git pull
        cd ../..
        #mv projects/$t/.git projects/$t/__gitstrip
    else
        echo "Project '$t' has not been cloned - cloning now..."
        mkdir projects/$t
        git clone $GIT_PREFIX/$t.git projects/$t

        cd projects/$t
        [ -e ../../scripts/on-clone.sh ] && ../../scripts/on-clone.sh $t
        cd ../..

        #mv projects/$t/.git projects/$t/__gitstrip
    fi;
done

echo "STEP 2- Fetch dependencies"
echo "--------------------------"

# Install dependencies
# for t in ${PROJECTS[@]}; do
#     if [ ! -e projects/$t ]; then
#         echo "Skipping uncloned project '$t'..."
#         continue;
#     fi;

#     echo "Processing '$t'..."
#     cd projects/$t
#     npm install
#     cd ../..
# done

echo " -- Setup complete! --"
