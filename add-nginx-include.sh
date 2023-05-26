#!/bin/bash

# Edit this variable if necessary. Path to web directory
web_dir=/volume1/web

# Edit this variable if necessary. The name of your desired config file
conf_file=nginx.conf

# Include filenames beginning with a '.' in the results
shopt -s dotglob

# Define search pattern
search_pattern="$web_dir/([a-zA-Z\.]+)"

# Directory of config files
directory_path=/usr/local/etc/nginx/conf.d

# Iterate over contents of directory
for file_path in "$directory_path"/*; do

    # Check if item is of type file
    if [ -f "$file_path" ]; then
        
        # Check if there's a match for the search pattern
        if grep -qE "$search_pattern" "$file_path"; then
            
            # Get the site directory path for the website corresponding to this config file
            site_dir=$(grep -oE "$search_pattern" "$file_path" | tail -n 1)
            
            # Create an include statement
            new_line="include $site_dir/$conf_file;"
			
            # If the new line doesn't already exist, append to the end of the file
            if ! grep -q "$new_line" "$file_path"; then
            	echo "$new_line" >> "$file_path"
            	echo "$new_line added to $file_path"
            # Otherwise, do nothing
			else
				echo "include exists for $site_dir"
			fi
        fi
    fi
done

# Restart nginx
nginx -s reload && nginx -t
