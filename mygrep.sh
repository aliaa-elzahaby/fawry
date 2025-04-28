#!/bin/bash

show_help() {
  echo "Usage: $0 [OPTIONS] search_string filename"
  echo ""
  echo "Options:"
  echo "  -n        Show line numbers for matching lines"
  echo "  -v        Invert the match (show lines that do NOT match)"
  echo "  --help    Display this help message and exit"
  echo ""
  exit 0
}

# Initialize flags
show_line_numbers=false
invert_match=false

# Manually handle --help
for arg in "$@"; do
  if [[ "$arg" == "--help" ]]; then
    show_help
  fi
done

# Use getopts for -n and -v
while getopts ":nv" opt; do
  case $opt in
    n) show_line_numbers=true ;;
    v) invert_match=true ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done
shift $((OPTIND -1))

# Validate remaining args
if [[ $# -lt 2 ]]; then
  echo "Error: Missing search string or filename."
  echo "Usage: $0 [OPTIONS] search_string filename"
  exit 1
fi

search="$1"
file="$2"

if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

# Read file and process lines
line_num=0
while IFS= read -r line; do
  ((line_num++))
  echo "$line" | grep -qi "$search"
  matched=$?

  if $invert_match; then
    matched=$((!matched))
  fi

  if [[ $matched -eq 0 ]]; then
    if $show_line_numbers; then
      echo "${line_num}:$line"
    else
      echo "$line"
    fi
  fi
done < "$file"
