#!/bin/bash
if [ $# -ne 1 ]; then
	echo "$0" 
	exit 1
fi
csv_filename="$1"
if [ ! -f "$csv_filename" ]; then
	        echo "File not found :"
		        exit 1
fi
while IFS=, read -r directory_name file_name number; do
	        if [ ! -d "$directory_name" ]; then
			                mkdir -p "$directory_name"
					                touch "$file_name"
							        fi
								        path="$directory_name/$file_name"
									        echo "number" >> "file_name"
									done < "$csv_filename"
