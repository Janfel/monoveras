#!/usr/bin/env bash

java -jar bob.jar --archive --platform "$PLATFORM" --bundle-output "build/release/" resolve distclean build bundle

