# update_env.xsh

# Update Env Script

This is a `xonsh` script designed to automatically update an `.env` file with API key environment variables from the current environment.

## Features

- **Extracts API Keys**: The script scans the current environment for variables ending with `API_KEY` and collects their key-value pairs.
- **Updates .env File**: It then writes these key-value pairs to an `.env` file located in the user's home directory.

## Requirements

- **xonsh**: This script needs to be run in the `xonsh` shell environment.
- **Environment Variables**: Ensure your environment variables are properly set with keys ending in `API_KEY`.

## Usage

To use the script, simply run it in the `xonsh` shell:

```sh
./update_env_script.xsh
```

## How It Works

1. **Extracting API Keys**:
    - The script enumerates all environment variables using `${...}.items()`.
    - It filters out variables whose names end with `API_KEY`.

2. **Formatting for .env**:
    - The selected key-value pairs are formatted into the `.env` file format (`KEY=VALUE`).
  
3. **Writing to .env File**:
    - The script writes the formatted string to a file named `.env` in the user's home directory.

Here's the detailed explanation of the script:

```xonsh
#! /usr/bin/xonsh

#DOC#+api+=2024-06= "Update env file for storing api keys"

def update_env():
    # Extract API keys from the environment variables
    apikeys_dict = {k:v for k,v in ${...}.items() if k[-7:]=='API_KEY'}
    
    # Format the API keys into .env file style
    apikeys_content = '\n'.join([f"{k}={v}" for k,v in apikeys_dict.items()])+'\n'
    
    # Write the formatted API keys to the .env file in the home directory
    with open($HOME+'/.env','w') as f:
        f.write(apikeys_content) 

update_env()
```

This script simplifies the management of API keys by ensuring they are always up-to-date in a centralized `.env` file, reducing the manual effort required to keep these keys synchronized.