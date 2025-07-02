#!/usr/bin/env bash
# Test script for the environment loader

echo "=== Testing Environment Loader ==="

# Test 1: Minimal load
echo -e "\n1. Testing minimal load:"
source ../lib/env.sh
load_env_minimal
echo "SCRIPTS_ENV_LOADED: $SCRIPTS_ENV_LOADED"
echo "SCRIPTS: $SCRIPTS"

# Test 2: Colors
echo -e "\n2. Testing colors:"
load_env "colors"
echo "FLEXOKI_LOADED: $FLEXOKI_LOADED"
echo "PRIMARY_COLOR: $PRIMARY_COLOR"
echo "Sample colors: $FLEXOKI_RED (red) $FLEXOKI_BLUE (blue)"

# Test 3: FZF  
echo -e "\n3. Testing FZF:"
load_env "fzf"
echo "FZF_ENV_LOADED: $FZF_ENV_LOADED"
echo "FZF_DEFAULT_COMMAND: $FZF_DEFAULT_COMMAND"
echo "FZF preview command: $FZF_PREVIEW_COMMAND"

# Test 4: Multiple loads (should not reload)
echo -e "\n4. Testing guard against multiple loads:"
load_env "debug,colors,fzf" 2>&1 | head -3

# Test 5: Git paths
echo -e "\n5. Testing git paths:"
load_env "git"
echo "GIT_REPOS: $GIT_REPOS"
echo "LOCALDATA: $LOCALDATA"

echo -e "\n=== Test Complete ==="