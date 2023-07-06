#!/bin/bash

# Load nvm if it's not already loaded
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Get the list of available node versions from the nvm directory
versions=$(ls "$NVM_DIR/versions/node")

# Store the available versions in an array
available_versions=()
while IFS= read -r line; do
  available_versions+=("$line")
done <<< "$versions"

# Print the available versions for selection
echo "Available Node.js versions:"
PS3="Enter the desired Node.js version: "
select version in "${available_versions[@]}"; do
  if [[ -n "$version" ]]; then
    # Use nvm to switch to the selected version
    nvm use "$version"
    # Update PATH to use the selected version
    export PATH="$NVM_DIR/versions/node/$version/bin:$PATH"
    break
  else
    echo "Invalid option. Please try again."
  fi
done

# Confirm the selected Node.js version
node --version
