#!/usr/bin/env bash

#check if the environment variable for the config location has been set
#if not set it
if [[ -z "${RECEIPT_PARSER_CONFIG_DIR}" ]]; then
  export RECEIPT_PARSER_CONFIG_DIR="data/config"
fi



CONFIG_PATH="${PWD}/${RECEIPT_PARSER_CONFIG_DIR}/config.yml"

print_fail() {
    echo -e "\t\033[31m config file is not valid or present\033[0m"
    echo -e "\t\033[31m Copying default config file to $CONFIG_PATH \033[0m"
}

# generate api token if non exists
if [ ! -f "$CONFIG_PATH" ];then
  print_fail
  cp "${PWD}/config_default.yml" "$CONFIG_PATH"
  if [ ! -f "$CONFIG_PATH" ];then
    echo -e "\t\033[31m config file creation failed \033[0m"
  fi
else
  echo -e "\t\033[32m config file is present \033[0m"
fi
