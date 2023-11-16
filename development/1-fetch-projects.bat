@echo off
echo Cloning projects...

set GIT_PREFIX=https://github.com/twit2

if /i "%1"=="/ssh" (
    echo Fetching projects using SSH...
    set GIT_PREFIX=git@github.com:twit2
) else (
    echo Fetching projects using HTTPS...
)

git clone %GIT_PREFIX%/std-library.git projects/std-library
git clone %GIT_PREFIX%/svc-users.git projects/svc-users
git clone %GIT_PREFIX%/svc-auth.git projects/svc-auth
git clone %GIT_PREFIX%/spec.git projects/spec
git clone %GIT_PREFIX%/frontend.git projects/frontend
git clone %GIT_PREFIX%/svc-posts.git projects/svc-posts