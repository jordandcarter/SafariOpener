#!/bin/bash

# List all available simulators and extract their IDs
SIMULATOR_IDS=$(xcrun simctl list devices | grep -oE '([0-9A-F-]{36})')

# Loop through each simulator ID and delete the simulator
for SIMULATOR_ID in $SIMULATOR_IDS; do
  xcrun simctl delete $SIMULATOR_ID
done

echo "All simulators have been deleted."
