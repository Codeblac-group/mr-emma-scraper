#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

# Update and install necessary system libraries for Chrome
apt-get update && apt-get install -y \
    wget gnupg libnss3 libatk1.0-0 libx11-xcb1 libcups2 libxcomposite1 \
    libxdamage1 libxrandr2 libgbm1 libasound2 libpangocairo-1.0-0 \
    libpangoft2-1.0-0 libfontconfig1 libxss1 libxtst6 xdg-utils curl unzip \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Chromium manually
wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y /tmp/chrome.deb || apt-get install -f -y
rm /tmp/chrome.deb

# Install Puppeteer (it will detect the installed Chromium)
npm install puppeteer --no-save
