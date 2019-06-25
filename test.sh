#! /bin/bash
set -x
set -e

mkdir test
cd test
git init
echo "hello" >readme
git add readme
git commit -m "initial import"
date

sleep 5
git checkout -b br1
date                   # this is the date that I want to find out.

sleep 5
echo "hello_br1" >readme
git commit -a -m "hello_br1"
date

echo "hello_br1_b" >readme
git commit -a -m "hello_br1_b"

git checkout master
echo "hello_master" >readme
git commit -a -m "hello_master"

git branch -a; 
git log --all --graph --abbrev-commit --decorate --pretty=format:"%h - %an, %ad : %s" --date=iso
