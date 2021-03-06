#!/bin/bash
BASE_URL="ember-dialog" LOCATION_TYPE="hash" ember build
BASE_URL="ember-dialog/docs" LOCATION_TYPE="hash" ember ember-cli-jsdoc
rm -rf gh-pages/*
mkdir -p gh-pages/docs
cp -R dist/* gh-pages/
mv docs/* gh-pages/docs/
cd gh-pages
git init
git remote add docs git@github.com:wheely/ember-dialog.git
git fetch docs
git checkout --orphan gh-pages
git add .
git commit -am "Site"
git push -f docs gh-pages
git branch -u docs/gh-pages
cd ..
rm -rf gh-pages
