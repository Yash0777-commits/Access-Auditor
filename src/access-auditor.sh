#!/bin/bash


# AccessAuditor: A script to list users with read access to a GitHub repository
# Author: Yash Kumbhar
# Date: 20/12/24
# Vesrion: 1.0.0


# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token (export these variables before running)
USERNAME=$username  # Replace this with your GitHub username
TOKEN=$token        # Replace this with your GitHub personal access token

# Function to display usage instructions
function usage {
    echo "Usage: $0 <REPO_OWNER> <REPO_NAME>"
    echo "Example: $0 my-org my-repo"
    exit 1
}

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send the GET request to GitHub API and capture the HTTP response and body
    response=$(curl -s -w "%{http_code}" -u "${USERNAME}:${TOKEN}" "$url")
    http_code="${response: -3}"  # Extract the HTTP status code from the response
    body="${response::-3}"       # Extract the body of the response (everything except the status code)

    # Check for a successful response (HTTP status code 200)
    if [[ "$http_code" -ne 200 ]]; then
        echo "Error: API request failed with status code $http_code"
        exit 1
    fi

    echo "$body"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local repo_owner="$1"
    local repo_name="$2"
    local endpoint="repos/${repo_owner}/${repo_name}/collaborators"

    # Fetch collaborators from the repository
    collaborators=$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions and .permissions.pull == true) | .login')

    # Check if collaborators were found
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${repo_owner}/${repo_name}."
    else
        echo "Users with read access to ${repo_owner}/${repo_name}:"
        echo "$collaborators"
    fi
}

# Main script execution
if [[ -z "$1" || -z "$2" ]]; then
    usage
fi

REPO_OWNER=$1
REPO_NAME=$2

list_users_with_read_access "$REPO_OWNER" "$REPO_NAME"

