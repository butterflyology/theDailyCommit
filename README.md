## The Daily Commit

### 2023-05-30

Well, look at you actually reading the contents of the repo. NOt a common occurance. I made this script because many HR managers just look to see if there is a frequent commit history but never deeper than that. This repo exists to get passt the first layer of HR.

This repo exists to hold a `bash` script that will make a push every time you run it so it looks like you are super productive with GitHub. But in reality, you are just being awesome. And you, you are being more awesome by really reading the repo. Good on ya.

### How it works

The script `automatedDailyCommit.sh` runs automatically each morning via a macOS Launch Agent (`launchd`). It generates a random number of commits using a weighted distribution (mean: ~6, mode: 6, range: 1–15), then cleans up after itself with a final cleanup commit.

The Launch Agent plist is located at:
`~/Library/LaunchAgents/com.chris.thedailycommit.plist`

It is scheduled to run daily at 7:00am. Logs are written to:
- `launchd_daily_commit.out.log`
- `launchd_daily_commit.err.log`

To verify it is loaded:
`launchctl list | grep com.chris.thedailycommit`

To trigger it manually:
`launchctl start com.chris.thedailycommit`

### Major commits
1. 2023-05-30: Initial commit of code
1. 2023-06-04: Updated code to commit and push three changes. Gotta keep those cubes filled in dark.
1. 2023-06-19: Updated to allow a variable number of commits to be called from the command line.
1. 2024-12-17: Updated code to improve the filenames and handle errors. Migrated to macOS Launch Agent.
1. 2025-02-27: Added error handling and logging. Updated distribution of weights to push more commits more often, added a cleanup `git add -A` command.