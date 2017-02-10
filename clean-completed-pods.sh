#!/bin/sh

app_logs=$ALLAPPLICATIONLOGS

for app_dir in $(find "$app_logs" -Bmin +30 -type d -maxdepth 1 -mindepth 1); do
  total_files=$(find "$app_dir" -type f | wc -l )
  empty_files=$(find "$app_dir" -size 0 -type f | wc -l)
  if [[ $total_files -eq $empty_files ]]; then
    echo "delete dir ${app_dir}"
    rm -rf "${app_dir}"
  fi
done
