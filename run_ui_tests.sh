#!/bin/bash

# List all available simulators and extract their IDs
SIMULATOR_IDS=$(xcrun simctl list devices | grep -oE '([0-9A-F-]{36})')

# Loop through each simulator ID and delete the simulator
for SIMULATOR_ID in $SIMULATOR_IDS; do
  echo "Deleting simulator with ID: $SIMULATOR_ID"
  xcrun simctl delete $SIMULATOR_ID
done

echo "All simulators have been deleted."

xcrun simctl list devices

# Create a new iPhone 11 simulator for iOS 17.2
SIMULATOR_NAME="iPhone 11"
SIMULATOR_RUNTIME="iOS-17-2"
DEVICE_TYPE="com.apple.CoreSimulator.SimDeviceType.iPhone-11"

# Create the simulator and capture its ID
SIMULATOR_ID=$(xcrun simctl create "$SIMULATOR_NAME" "$DEVICE_TYPE" "com.apple.CoreSimulator.SimRuntime.$SIMULATOR_RUNTIME")

# Check if the simulator was created successfully
if [ -z "$SIMULATOR_ID" ]; then
  echo "Failed to create simulator."
  exit 1
fi

echo "Simulator created with ID: $SIMULATOR_ID"

xcrun simctl list devices

# Path to your Fastfile
FASTFILE_PATH="fastlane/Fastfile"

# Replace the destination ID in the Fastfile
if [ -f "$FASTFILE_PATH" ]; then
  sed -i "" "s/destination: \"id=[^\"]*\"/destination: \"id=$SIMULATOR_ID\"/" "$FASTFILE_PATH"
  echo "Updated Fastfile with new simulator ID."
  cat "$FASTFILE_PATH"
else
  echo "Fastfile not found at $FASTFILE_PATH."
  exit 1
fi

# Run the Fastlane lane
bundle exec fastlane run_ui_tests
