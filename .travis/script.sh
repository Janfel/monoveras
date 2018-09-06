#!/usr/bin/env bash

platforms=(Windows Linux)
declare -A name=(
  [Windows]=x86-win32
  [Linux]=x86-linux
  [macOS]=x86-darwin
  [macOS64]=x86_64-darwin
  [HTML5]=js-web
  [iOS]=armv7-darwin
  [Android]=armv7-android
)

mkdir -p build/release
java -jar bob.jar --archive distclean resolve build

for platform in "${platforms[@]}"
do
    mkdir "build/release/$platform"
    java -jar bob.jar --bundle-output "build/release/$platform" --platform "${name[$platform]}" bundle
    tar --no-same-owner --no-same-permissions -C "build/release" -czf "build/release/$platform.tar.gz" "$platform"
done

