#!/bin/bash

if [ ! -d "./data" ]; then
	mkdir data
fi

cd data
if [ ! -d "./.git" ]; then
	git clone git@github.com:dd32/wporg-plugins-data.git . --branch=data
fi
git pull

cd ..

php update.php

cd data
git add *
git commit -m "Automated Updates" && git push
cd ..
