# AccessAuditor

AccessAuditor is a simple yet powerful Bash script designed to list all users who have read access (pull permissions) to a specified GitHub repository. This can be particularly useful for managing access permissions in collaborative environments.

---

## Table of Contents

1. [Description](#description)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Dependencies](#dependencies)
6. [Examples](#examples)
7. [Authors](#authors)
8. [License](#license)

---

## Description

AccessAuditor leverages the GitHub API to list users with read access to a specified repository. It uses `curl` for API requests and `jq` to parse JSON responses, making it lightweight and efficient.

---

## Prerequisites

Ensure you have the following installed on your system:

- **curl**: For making HTTP requests to the GitHub API.
- **jq**: For parsing JSON responses from the GitHub API.

### Installing Prerequisites

#### For Windows:

- **curl**:
  1. Download and install from [curl for Windows](https://curl.se/windows/).
  2. Extract the archive to a directory (e.g., `C:\curl`) and add `curl.exe` to your system PATH.

- **jq**:
  1. Download from the [official jq GitHub releases page](https://github.com/stedolan/jq/releases).
  2. Extract it and add `jq.exe` to your system PATH.

#### For macOS:

- **curl**: Already installed by default. Verify with:
  ```bash
  curl --version
  ```
- **jq**: Install using Homebrew:
  ```bash
  brew install jq
  ```

#### For Linux:

- **curl**:
  ```bash
  sudo apt-get install curl   # Debian-based distributions
  sudo yum install curl       # Red Hat-based distributions
  ```
- **jq**:
  ```bash
  sudo apt-get install jq     # Debian-based distributions
  sudo yum install jq         # Red Hat-based distributions
  ```

---

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo/AccessAuditor.git
   cd AccessAuditor
   ```

2. **Set up environment variables**:
   Export your GitHub username and personal access token:
   ```bash
   export USERNAME="your-github-username"
   export TOKEN="your-personal-access-token"
   ```

3. **Make the script executable**:
   ```bash
   chmod +x access_auditor.sh
   ```

---

## Usage

To list users with read access to a GitHub repository, use the following command:

```bash
./access_auditor.sh <REPO_OWNER> <REPO_NAME>
```

### Example:

```bash
./access_auditor.sh my-org my-repo
```
This command will output a list of users who have read access to the specified repository.

---

## Dependencies

AccessAuditor relies on:

1. **curl**: For making HTTP requests to the GitHub API.
2. **jq**: For parsing the JSON output from the API to extract user information.

To install these dependencies:

```bash
sudo apt-get install curl jq  # Debian-based Linux systems
```

---

## Examples

- List users with read access to a repository owned by `my-org` named `my-repo`:
  ```bash
  ./access_auditor.sh my-org my-repo
  ```

- Customize output to show additional user details (modify the script to include specific fields).

---

## Authors

- **Author**: [Your Name]
- **Date**: [Current Date]
- **Version**: 1.0.0

---

## License

This script is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Additional Information

### requirements.txt

For convenience, you can install necessary dependencies using a `requirements.txt` file. Although primarily used for Python, it can be adapted to document Bash script dependencies.

```text
curl
jq
```

### Script Usage Notes

- Ensure your GitHub credentials (username and personal access token) are exported as environment variables before running the script:
  ```bash
  export USERNAME="your-github-username"
  export TOKEN="your-personal-access-token"
  ```
