#!/bin/bash

# Method 1: Using -v operator (best for Bash 4.2+)
echo "Testing with -v operator:"
if [[ -v MY_VAR ]]; then
    echo "MY_VAR is set"
else
    echo "MY_VAR is not set"
fi

# Method 2: Using parameter expansion with -z
echo -e "\nTesting with -z test:"
if [ -z "${MY_VAR+x}" ]; then
    echo "MY_VAR is not set"
else
    echo "MY_VAR is set"
fi

# Method 3: Using parameter expansion with default value
echo -e "\nTesting with parameter expansion:"
if [ -z "$MY_VAR" ]; then
    echo "MY_VAR is empty or not set"
else
    echo "MY_VAR is set and not empty"
fi

# Demonstration with a set variable
echo -e "\nNow testing with a set variable:"
TEST_VAR="Hello"
if [[ -v TEST_VAR ]]; then
    echo "TEST_VAR is set"
else
    echo "TEST_VAR is not set"
fi