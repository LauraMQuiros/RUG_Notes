import os
import time
import subprocess
import requests
import json

# Configuration
GIT_REPO_PATH = "h"  # Local path to your repo
SPLUNK_HEC_URL = "https://splunk-instance:8088"  # Your Splunk HEC URL
SPLUNK_TOKEN = "your_splunk_token"
GITHUB_REPO = "h"  # Format: owner/repository
GITHUB_TOKEN = "h"  # GitHub personal access token
CHECK_INTERVAL = 60  # Check every 60 seconds
TARGET_BRANCH = "develop"

def get_latest_commit():
    """Get the latest commit hash on the target branch."""
    try:
        return subprocess.check_output(
            ["git", "-C", GIT_REPO_PATH, "rev-parse", f"origin/{TARGET_BRANCH}"]
        ).strip().decode()
    except subprocess.CalledProcessError:
        return None

def is_pull_request_merge(commit_hash):
    """Check if a commit is a PR merge using GitHub API."""
    url = f"https://api.github.com/repos/{GITHUB_REPO}/commits/{commit_hash}"
    headers = {"Authorization": f"token {GITHUB_TOKEN}"}
    
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            commit_data = response.json()
            # Check if commit message contains 'Merge pull request'
            return "Merge pull request" in commit_data.get("commit", {}).get("message", "")
        else:
            print(f"GitHub API error: {response.status_code} - {response.text}")
            return False
    except requests.RequestException as e:
        print(f"GitHub API request error: {e}")
        return False

def get_commit_info(commit_hash):
    """Get commit details."""
    try:
        log_output = subprocess.check_output(
            ["git", "-C", GIT_REPO_PATH, "log", "-1", "--pretty=format:%H%n%an%n%ad%n%s", commit_hash]
        ).decode().split("\n")

        return {
            "commit_hash": log_output[0],
            "author": log_output[1],
            "date": log_output[2],
            "message": log_output[3],
        }
    except subprocess.CalledProcessError:
        return None

def send_to_splunk(data):
    """Send PR merge data to Splunk."""
    headers = {"Authorization": f"Splunk {SPLUNK_TOKEN}", "Content-Type": "application/json"}
    payload = {"event": data}

    try:
        response = requests.post(f"{SPLUNK_HEC_URL}/services/collector", headers=headers, data=json.dumps(payload), verify=False)
        if response.status_code == 200:
            print("Data sent to Splunk successfully.")
        else:
            print(f"Error sending data to Splunk: {response.text}")
    except requests.RequestException as e:
        print(f"Request error: {e}")

def main():
    """Monitor for PR merges on develop branch."""
    subprocess.run(["git", "-C", GIT_REPO_PATH, "checkout", TARGET_BRANCH], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    last_commit = get_latest_commit()

    while True:
        subprocess.run(["git", "-C", GIT_REPO_PATH, "fetch"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        new_commit = get_latest_commit()

        if new_commit and new_commit != last_commit:
            print(f"New commit detected: {new_commit}")
            
            if is_pull_request_merge(new_commit):
                commit_info = get_commit_info(new_commit)
                send_to_splunk(commit_info)
                print(f"PR merge detected: {commit_info}")

            last_commit = new_commit

        time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
    main()
