#!/bin/bash                                                                            

download_folder= "./data/in"

if read -p "Please provide the full path to your Acc.list.txt file: " filepath; then
    if [-s "$filepath" ]; then 
    while IFS= read -r accesion; 
    do
        fastq-dump --split-files --gzip "$accession" -O "$dowload_folder" "$accesion"
    done < "$filepath"
    echo "Dowloaded files are stored in : $download_folder"
    else
    echo "ERROR: the specified file is empty or does not exist"
    fi
else
    echo "Error: No file path provided"
fi