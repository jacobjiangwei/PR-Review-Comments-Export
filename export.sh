#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <repository> <username>"
    echo "Example: $0 colinhacks/zod mertssmnoglu"
    exit 1
fi

# Read repository and username from command-line arguments
repository=$1
username=$2

# Output file
default_output_file="${username}_comments.csv"
output_file=${OUTPUT_FILE:-$default_output_file}

# Clear the output file and add a header
echo "PR Number,Comment Body,URL,Diff Hunk" > "$output_file"

# Fetch all PR numbers from the repository with pagination
pr_numbers=""
page=1
per_page=1000

while true; do
    echo "Fetching page $page..."
    next_page_prs=$(gh api -X GET "repos/$repository/pulls?state=all&per_page=$per_page&page=$page" --jq '.[].number')
    echo "PRs on page $page: $next_page_prs"
    if [ -z "$next_page_prs" ]; then
        break
    fi
    pr_numbers="$pr_numbers $next_page_prs"
    page=$((page + 1))
done

echo "PRs total : $pr_numbers"
# Loop through all PR numbers and fetch comments
for pr_number in $pr_numbers; do
    echo "Fetching review comments for PR #$pr_number..."
    comments=$(gh api repos/$repository/pulls/$pr_number/comments)

    echo "$comments" | jq -c ".[] | select(.user.login == \"$username\")" | while read -r comment; do
        body=$(echo "$comment" | jq -r '.body')
        url=$(echo "$comment" | jq -r '.html_url')
        diff_hunk=$(echo "$comment" | jq -r '.diff_hunk')

        # Clean up the body and diff_hunk to handle newlines and escape quotes
        clean_body=$(echo "$body" | tr '\n' ' ' | sed 's/"/""/g')
        clean_diff_hunk=$(echo "$diff_hunk" | tr '\n' ' ' | sed 's/"/""/g')

        # Append to the CSV file
        echo "$pr_number,\"$clean_body\",$url,\"$clean_diff_hunk\"" >> "$output_file"
    done
done

echo "Comments by $username have been saved to $output_file."
