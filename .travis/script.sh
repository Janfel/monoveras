#!/usr/bin/env bash

platforms="x86-win32 x86-linux"

mkdir -p build/release
java -jar bob.jar --archive clean resolve build

for platform in $platforms
do
    mkdir "build/release/$platform"
    java -jar bob.jar --bundle-output "build/release/$platform" --platform "$platform" bundle
done

