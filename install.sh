#!/bin/sh
gcc connect.c -o connect-proxy
cp connect-proxy /usr/local/bin
chmod +x /usr/local/bin
