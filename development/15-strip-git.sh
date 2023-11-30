#!/bin/bash
export PROJECTS=(std-library svc-users svc-auth svc-posts frontend)

# Process projects
for t in ${PROJECTS[@]}; do
    rm -rf projects/$t/.git
done