# Think About Time

Most of these ideas were fairly new to me, so I began at the top of my list and worked my way down. I spent the most time learning about meditation and the Pomodoro Technique. Meditation, while not something I've done in the past, seems like a great way to build focus in the morning which will help last throughout the day. The Pomodoro Technique seems like a very solid way to build a structure for the work days during phase 0, in terms of setting schedules, estimating completion times, and measuring progress.

Time boxing is simply setting aside a consistent block of time to work on a task, and then measuring the progress and accomplishments at the end of each block - the Pomodoro Technique is the perfect example of this. This will be very helpful in Phase 0, since most of the coding concepts are new and unfamiliar. By setting aside specific lengths of time to work on tasks, I can measure improvements by how many increments it takes to complete them. It also allows me to maintain focus as the tasks grow more difficult. Rather than get distracted when a problem gets too difficult, I'm motivated to use the time block as best I can to solve the problem and continue working.

I currently manage my time by setting aside large blocks of time for general activities. This means that I wake up at a certain time, use the first few hours of the day for the gym, a healthy breakfast, and preparing for the day, then follow through with a large time block set aside for work. For now, this is a viable strategy. However, while this is a good framework to organize the day, there is certainly room for improvement. Subdividing these large blocks into smaller time increments will allow me to focus on specific tasks during the work phase. For instance, I should expect a trip to the gym to take no more than two or three Pomodoro segments, depending on the workout. Subdividing the time this way will keep me focused on getting finished on time and ready to start the work day as planned - eliminating most of the chatter and distractions at the gym, but still allowing for small breaks in between increments.

My plan for Phase 0 is to implement the Pomodoro Technique into the general framework I've already planned out. By breaking down the framework into individual Pomodoro blocks, I can keep myself on track, maintain focus by allowing myself small breaks in between increments, and measure progress day after day. This allows me to get the most out of a working day without suffering from burning out too early. As I get more comfortable with this way of thinking, it allows me to add additional Pomodoro blocks into the schedule as I see fit - for instance, adding an increment for meditation at the beginning of the day to help with overall focus.

# The Command Line

A shell is basically a processor that can execute commands given directly to to computer, rather than through a graphical interface. Bash is a specific type of shell for the UNIX operating system. As I am currently working on these assignments on a Windows system, I used a different shell (Powershell).

The most challenging part of this lesson was getting through the video, to be honest. It was hard to follow along with the video for an hour without having any practical examples to work on alongside of watching it. Since a lot of these concepts were new, a lot of things in the video did not make sense until getting the chance to go through the Command Line Crash Course. That course definitely improved my understanding of shell commands by actually working through examples. All of the commands I learned through the crash course successfully worked as intended.

To me, it seems like the most important shell commands are searching through files for very specific pieces of information. This is something that would be very time-consuming through the standard graphical interfaces that I am used to, and can be done much more efficiently through the shell. This requires more memorization of commands so that I could confidently navigate through the shell, but the payoff in time and efficiency seems well worth it.

The commands listed perform the following functions:

pwd - Print working directory: shows your current location in the directory tree

ls - Lists the files and directories in a specific directory

mv - Moves (or renames) files

cd - Changes your location in the directory tree

../ - Changes your location to the next higher directory in the tree

touch - Creates a new file (on the UNIX operating system)

mkdir - Creates a new directory

less - displays the contents of a file in a separate screen

rmdir - Deletes a directory (and on Windows, allows you to also delete the contents within)

rm - Deletes a file

help - Displays the built-in help manual for specific commands, including help itself

# Forking and Cloning



Instructions for creating a new repository:

First, navigate to your GitHub profile page. In the upper right corner, there will be a "+" icon. Clicking on this gives you the option to create a new repository - select that. This will take you to a new page with several options. Your repository will need a name, which can be supplemented with a description. Repositories can also be set to public or private depending on if you would like others to view your repository. Finally, you may select an open source license for your project if you choose to have one. Once you are satisfied with all options, click on "Create Repository" at the bottom of the page. This will take you to your newly created repository.

Instructions for forking an existing repository:

Navigate to the repository you wish to fork. You can determine if this repository belongs to you by checking the repository address for your username - an existing repository should not include your name. Click on the "Fork" button in the upper right. This will bring up a pop-up where you can select the destination - for these purposes, you would select your own profile. Once selected, you will automatically be navigated to your own copy of the repository. You can check this by looking for your username in the address.

Instructions for cloning a repo:

Find the URL for the repository on the repo page. Copy this to the clipboard. From the command line, navigate to the folder where you wish to clone the repo. Once there, enter the following command:

git clone [Repo URL]

Once entered, the repo will be cloned to that location. After the process is complete, you can check by using the ls command. A new folder containing the repo should be present.

Forking a repository allows you to add or modify existing code. For collaborating on projects, or using another piece of code as a starting point, you would prefer to do this than create a brand new repository and reinvent work that has already been completed.

This whole process was new to me, and I learned how to navigate GitHub and repositories, how to successfully fork them, and how to clone them with minimal referencing of the tutorials. Personally, I had no issues accessing the GitHub repositories and getting them successfully forked and cloned to my computer. Each repository is now stored in a local phase-0 folder. I found this interface to be easy to understand and the process to be fairly straightforward. 