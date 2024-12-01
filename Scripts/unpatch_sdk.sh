#!/bin/bash

SDK_NAME=$1
FRAMEWORK_NAME=$2

SDK_PATH=$(xcrun --sdk ${SDK_NAME} --show-sdk-path)

FRAMEWORK_PATH="${SDK_PATH}/System/Library/Frameworks/${FRAMEWORK_NAME}.framework"
MODULE_PATH="${FRAMEWORK_PATH}/Modules/${FRAMEWORK_NAME}.swiftmodule"

for swiftinterface_file in ${MODULE_PATH}/*.swiftinterface; do
  sed -i '' 's/ -enable-private-imports//g' ${swiftinterface_file}
  sed -i '' '/\/\* SWIFT_PD_GUESS_PATCH_BEGIN \*\//,\/\* SWIFT_PD_GUESS_PATCH_END \*\//d' ${swiftinterface_file}
done