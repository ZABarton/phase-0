# How does tracking and adding changes make developers' lives easier?

Tracking and adding changes makes life easier for a developer by creating a record of accountability for coding projects. If something goes wrong during the development process, these changes can be reviewed to find where the process went awry.

# What is a commit?

A commit is a method of saving changes in a repository. Commits provide a record of changes, along with space for the developer's comments and a unique ID. Commits can be recalled in the future by using the unique ID, and logs of every commit and the accompanying messages can be displayed.

# What are the best practices for commit messages?

Commit messages should be structured like an email message. The first line should resemble a subject line - a short title that summarizes the changes in the commit. This is followed by paragraphs explaining the details of the changes - this can be of varying length depending on how complex the changes are. There are a few conventions that should be followed when writing a commit message. Most important of these is writing verbs in the imperative to maintain consistency with other messages generated by git commands. There are style guides which recommend how to wrap text, add bullet points, etc.

# What does the HEAD^ argument mean?

HEAD is the commit that you are currently working on. The caret indicates the previous commit. Thus, the HEAD^ argument can be used with the git reset command to revert to the previous commit, and change files which had been previously committed.

# What are the 3 stages of a git change and how do you move a file from one stage to the other?

The three stages are checkout, add, and commit. The first stage, checkout, allows you to create a new branch of code from the master, so that your changes do not affect the master branch. In this working branch, you can create new files, directories, and modify code. To track the changes, you can move a file to the second stage by adding it to be committed. This allows you to see which files and directories have been modified by checking the status of the repository. Finally, when all of the changes are complete, the third stage is to commit the changes. This saves the changes and records it in a running log, along with the developer's commit message. The commands to move the files from one stage to the next are git checkout -b [branch name], git add [file name], and git commit [filename] -m [commit message].

# Write a handy cheatsheet of the commands you need to commit your changes?

git checkout -b - Creates a new branch
git add - Adds a file to the tracker
git commit - commits a file, opens up a text editor to write a message
git commit -m - same as above but allows you to write the message in the command line

# What is a pull request and how do you create and merge one?

A pull request is a summary of changes to your code that can be reviewed by other developers before it gets merged back into the master repository. Creating a pull request is started from the command line and finished in GitHub. In the command line, the changes are pushed from the local repository to the origin on GitHub. Once there, the developer can open a pull request by writing a title and summary of the changes in GitHub and creating a linkable page that can be shared with other developers. The pull request can be merged from this page by clicking the "Merge Pull Request" button, although it is generally a good idea to have another developer review the changes and merge the request.

git pull origin master - pulls changes from the remote repository and compares it to your master branch
git merge master - merges changes from the master into the feature branch to check for conflics
git push origin - pushes your local changes back to the remote repository.

# Why are pull requests preferred when working with teams?

It allows the team to have a chance to peer review changes before they permanently alter the master branch. This allows for an extra degree of accountability when working as a team, and also protects the integrity of the master code branch.
