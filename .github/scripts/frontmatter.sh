#!/bin/bash

file_path=$1
base_cmd="yq --front-matter=process"
# Check if the file has valid front matter

is_empty() {
  if $(echo "$1" | grep -q "^null$"); then
    return 0
  fi

  return 1
}

is_true() {
  if $(echo "$1" | grep -q "^true$"); then
    return 0
  fi

  return 1
}

update_property() {
  local property=$1
  local value=$2
  local file_path=$3

  $base_cmd -i ".$property = $value" "$file_path"
}

echo "Checking front matter"
if ! grep -q "^---$" "$file_path"; then
  echo "Front matter (start) not found, adding it"
  content=$(cat "$file_path")
  echo -e "---\n" >"$file_path"
  echo "$content" >>"$file_path"
fi

# Get the title from the front matter
echo "Checking title"
title=$($base_cmd '.title' "$file_path")
# Check if the title is empty
if is_empty "$title"; then
  update_property "title" "Changelog" "$file_path"
fi

echo "Checking pagefind"
pagefind=$($base_cmd '.pagefind' "$file_path")
if is_empty "$pagefind" || is_true "$pagefind"; then
  update_property "pagefind" "false" "$file_path"
fi

frontmatter=$($base_cmd '.' "$file_path")
# Check if the front matter does end with ---
if [ "${frontmatter: -3}" != "---" ]; then
  echo "Front matter (end) not found, adding it"
  echo -e "\n---\n" >>"$file_path"
fi
