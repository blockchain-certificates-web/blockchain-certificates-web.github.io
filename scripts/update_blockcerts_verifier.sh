#!/usr/bin/env bash

WORK_BRANCH=feat/update-buv

# checkout new branch
git checkout -b $WORK_BRANCH

# update blockcerts-verifier
npm i @blockcerts/blockcerts-verifier@latest

# clean unwanted files. Note: we could also handle that with .gitignore
echo 'Clean unwanted files'
pwd
git add node_modules/@blockcerts/blockcerts-verifier/dist/
git clean -df

# commit
git status
git add .
git commit -m "feat(BUV): update to latest version"

# push
git push origin $WORK_BRANCH
