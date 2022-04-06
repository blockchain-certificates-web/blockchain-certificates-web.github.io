#!/usr/bin/env bash

WORK_BRANCH=feat/update-schemas

git checkout -b $WORK_BRANCH

npm i @blockcerts/schemas@latest
cp -r node_modules/@blockcerts/schemas/schemas/ ./schema/
git status
git add schema/*
git status
git commit -am "feat(Schemas): update schemas"

git push origin $WORK_BRANCH
