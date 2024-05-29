#!/bin/bash

# Function to search for the version string in the ELF file
search_version_in_elf() {
    local elf_file="$1"
    local sub_string="$2"
    #local version_pattern="M4_VCI Firmware Version: v.[0-9]*\.[0-9]*\.[0-9]*"
	local version_pattern="$sub_string Firmware Version: v.[0-9]*\.[0-9]*\.[0-9]*"

    # Check if the file exists
    if [[ ! -f "$elf_file" ]]; then
        echo "Error: The file '$elf_file' was not found."
        exit 1
    fi

    # Extract strings from the ELF file and search for the version pattern
    local version_string=$(strings "$elf_file" | grep -E "$version_pattern")

    # Check if the version string was found
    if [[ -z "$version_string" ]]; then
        echo "No version string found in $elf_file."
    else
        echo $version_string
    fi
}

# Check if the correct number of arguments is provided
#if [[ $# -ne 1 ]]; then
#    echo "Usage: $0 <elf_file>"
#    exit 1
#fi

elf_file="$1"
sub_string="$2"

# Call the function
search_version_in_elf "$elf_file" "$sub_string"

