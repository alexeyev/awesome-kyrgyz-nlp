#!/usr/bin/env bash

echo "**** Installing the necessary dependencies..."
sudo apt-get -y install autoconf hfst vislcg3 lttoolbox pkg-config libtool
curl -sS https://apertium.projectjj.com/apt/install-nightly.sh | sudo bash
sudo apt-get -y -f install apertium-all-dev

echo "**** Cloning apertium-kir, may take a while..."
git clone git@github.com:apertium/apertium-kir.git

echo "**** Updating the configurations and building..."
cd apertium-kir/ && autoupdate && ./autogen.sh && ./configure && make

echo "**** Testing..."
echo "Бул кыргызча морфологиялык талдоо" | apertium -d . kir-morph

echo "**** Done."