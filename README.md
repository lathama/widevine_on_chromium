# Widevine On Chromium

Install Widevine on Chromium for Debian based systems.

## Introduction

Widevine is the DRM tool used by services like Netflix, Hulu, Amazon, and
Google to protect thier content. On Linux it is sometimes annoying to install
Chrome just for the Widevine so here is an option, add it to Chromium.

Chromium is the open source base for Chrome so it looks for the WidevineCdm for
use with content. We just need to provide an updated Widevine install with
current certs.

- https://en.wikipedia.org/wiki/Widevine


## Early method
as root after manually finding the latest url from https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable

```
cd /usr/src/
wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_130.0.6723.116-1_amd64.deb
dpkg-deb -x google-chrome-stable_130.0.6723.116-1_amd64.deb .
cp -r opt/google/chrome/WidevineCdm /usr/lib/chromium/
```

## Testing

I tested with a movie on Youtube but I guess one could use https://integration.widevine.com/jasmine_tests for testing.

## The Script

### Requirements

- curl
- root (sudo)

Tested on Debian 13

## Usage

The script does all the steps manually for you.

```
 ./getwidevine.sh
Current stable is pool/main/g/google-chrome-stable/google-chrome-stable_147.0.7727.55-1_amd64.deb
Downloading from http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_147.0.7727.55-1_amd64.deb
Unpack the package
Copy Widevine files to Chromium
Done!
```
