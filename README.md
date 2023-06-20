## The Daily Commit

### Chris Hamm
### 2023-05-30

Well, look at you actually reading the contents of the repo. This repo exists to hold a `bash`script that will make a push every time you run it so it looks like you are super productive with GitHub. But in reality, you are just being awesome. And you, you are being more awesome by really reading the repo. Good on ya. 

This is run as a `crontab -e` with the following:
`45 11 * * *  cd /Users/Chris/Projects/theDailyCommit && /Users/Chris/Projects/theDailyCommit/theDailyCommit.sh >/tmp/stdout.log 2>.tmp/stderr.log`


Major commits:
1. 2023-05-30: Initial commit of code
1. 2023-06-04: Updated code to commit and push three changes. Gotta keep those cubes filled in dark. 
1. 2023-06-19: Updated to allow a variable number of commits to called from the command line.