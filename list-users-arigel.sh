#!/bin/bash
##########
#About: Listing people having access to a repo
#Input: Export Username and token, Provide 2 inputs which are command line args
############

#GitHub API URL
API_URL="https://api.github.com"

#GitHub username and token
USERNAME="$username"
TOKEN="$token"

#User and repository information
REPO_OWNER=$1
REPO_NAME=$2

#Function to make a GET request to the GitHub API
function github_api_get {
local endpoint="$1"
local url="{$API_URL}/${endpoint}"

# send a GET request to the GitHub API with authentication
curl -s -u "${USERNAME}:${TOKEN}" "url"


#Function to list users with read access to the repository
function list_users_with_read_access {
local endpoint="repos/{$repo_OWNER}/{$REPO_NAME}/collaborators"

#Fetch list of collaborators on the repository

collaborators="$(github_get_api "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

#Helper function
function helper {
expected_args=2
if[$# -ne expected_args]; then
echo "please enter the required args"
}

#Display list of collaborators with read access

if[[ -z "$collaborators" ]]; then
echo "No users with read access found for "${REPO_OWNER}"/"${REPO-NAME}"
else 
echo "Users with read access to "${REPO_OWNER}"/"${REPO-NAME}"
echo "$collaborators"
fi
}

# Main script
echo "Listing users with access to "${REPO_OWNER}"/"${REPO-NAME}.."
list_users_with_read_access

