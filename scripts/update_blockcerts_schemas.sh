#!/usr/bin/env bash

WORK_BRANCH=feat/update-schemas

# checkout new branch
git checkout -b $WORK_BRANCH

# update blockcerts-schemas
npm i @blockcerts/schemas@latest

# post install hook, copy schemas to expected directory
cp -r node_modules/@blockcerts/schemas/schemas/ ./schema/

# add new files
git status
git add schema/*
git status
git commit -am "feat(Schemas): update schemas"

# clean up unwanted files
echo 'Clean unwanted files'
git clean -df

# push
git push origin $WORK_BRANCH
