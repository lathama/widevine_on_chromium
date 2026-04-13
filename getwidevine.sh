#!/usr/bin/bash
#
# Default to unknown version so we download the Packages.gz and check
# Apt looks to http://dl.google.com/linux/chrome/deb/ for a base
# The further path dists/stable/main/binary-amd64/Packages.gz is calculated
# "dists" is a search path
# "stable" and "main" are the client is configuration
# "binary-amd64" is the architecture aka CPU

# Variables
ARCH="amd64"
DOWNLOAD_URI=""
REPOBASE="http://dl.google.com/linux/chrome/deb/"
STABLE_ENTRY=""

# Move to working directory for easy cleaning
cd package_data

# Cleanup
rm -f Packages.gz
rm -f *.deb
rm -rf etc opt usr

# Get the manifest to find current version
curl -s -O http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-$ARCH/Packages.gz
STABLE_ENTRY=$(zgrep -o "pool/main/g/google-chrome-stable/google-chrome-stable.*deb" Packages.gz)
echo "Current stable is $STABLE_ENTRY"

# Build the download URI and download
DOWNLOAD_URI=$REPOBASE$STABLE_ENTRY
curl -s -O $DOWNLOAD_URI
echo "Downloading from $DOWNLOAD_URI"

echo "Unpack the package"
dpkg-deb -x google-chrome*.deb .

echo "Copy Widevine files to Chromium"
# Need root here
cp -r opt/google/chrome/WidevineCdm /usr/lib/chromium/

echo "Done!"

# TODO
# CLI options for arch
# review package data cleanup methods
