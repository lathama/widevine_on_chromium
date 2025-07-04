# Widevine on Chromium

## Why

If you want to watch videos from Netflix or other Widevine sources you need the client libraries.

## How

Chromium being the base for Google Chrome makes this easy by simply making the libraries availible in an expected place.

### Debian

- Get latest download url + version from
   - https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
- Download package
   - http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_138.0.7204.92-1_amd64.deb

In this example
1. As root go to the src dir
2. Get the package
2. Dump it out to a directory
3. Copy the libraries
4. Restart Chromium and test

```
cd /usr/src/
wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_138.0.7204.92-1_amd64.deb
dpkg-deb -x google-chrome-stable/google-chrome-stable_138.0.7204.92-1_amd64.deb .
ls opt/google/chrome/WidevineCdm/
LICENSE  manifest.json  _platform_specific
cp -r opt/google/chrome/WidevineCdm /usr/lib/chromium/
ps faxu | grep -i chrom
```

## Resources
- https://integration.widevine.com/diagnostics


## Thanks

If you find this useful and want to say thanks I have options at:

- https://lathama.net/Thanks
