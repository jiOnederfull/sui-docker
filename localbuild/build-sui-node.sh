#!/bin/bash

cd sui
git fetch --all

echo
echo
# check current tag
CURRENT_TAG=$(git describe --tags)
echo "**********************"
echo "Current tag is $CURRENT_TAG"
echo "**********************"
echo
echo

# get new tag
NEW_TAG=$1

# no input new tag
if [ -z "$NEW_TAG" ]; then
  read -p "Will you build the current tag '$CURRENT_TAG'? (y/n): " ANSWER
  case $ANSWER in
    [Yy]| [Yy][Ee][Ss] )
      echo "Start the build of $CURRENT_TAG."
      ;;
    *)
      echo "Stop the build."
      exit 0
      ;;
  esac
# yes input new tag
else
  git checkout $NEW_TAG
  CURRENT_TAG=$(git describe --tags)
  echo
  echo
  echo "**********************"
  echo "Checkouted to new tag $CURRENT_TAG"
  echo "**********************"
fi

cargo build --release --target x86_64-unknown-linux-gnu --bin sui-node

echo
echo
echo

echo "Completed"

cp ./target/x86_64-unknown-linux-gnu/release/sui-node ../bin
