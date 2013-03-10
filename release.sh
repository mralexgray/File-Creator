#!/bin/bash

#Build and upload the app
#The version is the first argument of the script

set -e

version="$1"
zipname="File Creator-$version.zip"

echo "Building version: $version"

xcodebuild -project "./File Creator.xcodeproj"  SYMROOT=./ -configuration Release

#-target unar

echo "Creating zip file"

cd ./Release
zip -q "$zipname" -r "File Creator.app"

echo "Uploading to Google Code"

googlecode_upload.py \
	--summary="File Creator $version" \
	--project="file-creator" \
	--labels="Type-Executable,OpSys-OSX,Featured" \
	"$zipname"

echo "Done"
