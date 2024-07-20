#!/bin/bash

for file in oldName*.txt; do
  new_name="newName${file:7}"
  mv "$file" "$new_name"
done
