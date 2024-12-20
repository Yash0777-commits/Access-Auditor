AccessAuditor
A script to list users with read access to a GitHub repository.

Table of Contents
Description
Prerequisites
Installation
Usage
Dependencies
Examples
Authors
License
Description
AccessAuditor is a simple yet powerful Bash script designed to list all users who have read access (pull permissions) to a specified GitHub repository. This can be particularly useful for managing access permissions in collaborative environments.

Prerequisites
Before you can use the script, ensure you have the following prerequisites installed:

curl: For making HTTP requests to the GitHub API.
jq: For parsing JSON responses from the GitHub API.
Installing Prerequisites
For Windows:

curl: Download and install curl from curl for Windows.
Extract the archive to a directory (e.g., C:\curl) and add curl.exe to your system PATH.
jq: Download jq from the official jq GitHub releases page and extract it.
Add jq.exe to your system PATH.
For macOS:

curl: Already installed by default on macOS.
Verify it by running curl --version.
jq:
Install using Homebrew:
bash
Copy code
brew install jq
For Linux:

curl:
Install with:
bash
Copy code
sudo apt-get install curl  # Debian-based distributions
sudo yum install curl      # Red Hat-based distributions
jq:
Install with:
bash
Copy code
sudo apt-get install jq  # Debian-based distributions
sudo yum install jq      # Red Hat-based distributions
Installation
Clone the repository: Clone the AccessAuditor script to your local machine:

bash
Copy code
git clone <repository-url>
cd AccessAuditor
Set up environment variables: Export your GitHub username and personal access token as environment variables. This is crucial for making authenticated API requests to GitHub.

bash
Copy code
export USERNAME="your-github-username"
export TOKEN="your-personal-access-token"
Make the script executable: Navigate to the script's directory and make it executable.

bash
Copy code
chmod +x access_auditor.sh
Usage
To list users with read access to a GitHub repository, run the script with the repository owner and name as arguments:

bash
Copy code
./access_auditor.sh <REPO_OWNER> <REPO_NAME>
Example
bash
Copy code
./access_auditor.sh my-org my-repo
This command will output a list of users who have read access to the specified repository.

Dependencies
The script relies on two main dependencies:

curl: Used for making HTTP requests to the GitHub API.
jq: Used for parsing the JSON output from the API to extract user information.
You can install these dependencies using the requirements.txt file provided:

bash
Copy code
pip install -r requirements.txt
Authors
Author: [Your Name]
Date: [Current Date]
Version: 1.0.0
License
This script is licensed under the MIT License. See the LICENSE file for more details.

Additional Information
requirements.txt:

Place this file in the same directory as your script and install the necessary dependencies:
bash
Copy code
pip install -r requirements.txt
Script Usage:

The script requires your GitHub credentials (username and token) to function properly. These should be set as environment variables before running the script:
bash
Copy code
export USERNAME="your-github-username"
export TOKEN="your-personal-access-token"
Customization:

Feel free to modify the script for different use cases. You can adjust the functions github_api_get and list_users_with_read_access to handle different GitHub API requests or output formats.