#!/bin/bash
xcodebuild archive \
-workspace ElectrodeContainer.xcworkspace \
-scheme ElectrodeContainer \
-destination "generic/platform=iOS" \
-archivePath build/ElectrodeContainer-Device \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
​
xcodebuild archive \
-workspace ElectrodeContainer.xcworkspace \
-scheme ElectrodeContainer \
-destination "generic/platform=iOS Simulator" \
-archivePath build/ElectrodeContainer-Simulator \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
​
xcodebuild -create-xcframework \
-framework build/ElectrodeContainer-Device.xcarchive/Products/Library/Frameworks/ElectrodeContainer.framework \
-framework build/ElectrodeContainer-Simulator.xcarchive/Products/Library/Frameworks/ElectrodeContainer.framework \
-output ElectrodeContainer.xcframework
​
