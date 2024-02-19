#!/bin/bash

# Specify the path to your .env file
env_file=".env"

# Function to read multi-line values
read_multiline_value() {
  local file="$1"
  local var_name="$2"
  local inside_var=false
  local value=""

  while IFS= read -r line; do
    if [[ "$inside_var" == true ]]; then
      if [[ "$line" == *"}"* ]]; then
        value+="$line"
        break
      else
        value+="$line"$'\n'
      fi
    fi

    if [[ "$line" == "$var_name="* ]]; then
      value="${line#*=}" # Initialize with the first line after the variable name
      inside_var=true
    fi
  done < "$file"

  echo "$value"
}

# Load specific environment variables
DAILY_REPORT_IGNORE_VN_WORKMAIL_REGX=$(grep "DAILY_REPORT_IGNORE_VN_WORKMAIL_REGX=" "$env_file" | cut -d'=' -f2)
KEY1=$(grep "KEY1=" "$env_file" | cut -d'=' -f2)
KEY2=$(read_multiline_value "$env_file" "KEY2")

# Your script code goes here
echo "DAILY_REPORT_IGNORE_VN_WORKMAIL_REGX is: $DAILY_REPORT_IGNORE_VN_WORKMAIL_REGX"
echo "KEY1 is: $KEY1"
echo "KEY2 is:"
echo "$KEY2"

# Rest of your script
