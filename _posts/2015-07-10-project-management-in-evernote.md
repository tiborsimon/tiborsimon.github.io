---
layout: post
title: Project Management in Evernote
categories: ['tools']
tags: ['evernote', 'task', 'management']
published: True
share_buttons: True
share_buttons: True
---


_Evernote_ is an application for keeping your ideas and notes synchronized between your various devices. You can create notes in notebooks, and you can assign tags to them. If you sacrifice some time overhead you can extend _Evernote_'s functionality to create a complete project management system. 

With this article you will be able to use _Evernote_ as a project management system. This system offers you the followings:

- Keep track of your projects
- Manage project dependencies
- Set up reminders and due dates
- Keep your files organized in association with the projects

# Warning!

There is some administrative overhead though you have to count with if you decide to apply this method. The extra time will pay back of course, as a clear and traceable reference of your work.

# Hierarchical structure

In _Evernote_ there are three basic hierarchical levels:

- _Notes_ - the basic building blocks
- _Notebooks_ - contains arbitrary number of notes
- _Stacks_ - contains arbitrary number of notebooks

Above the basic hierarchical organization there is the tag system which provides a finer, fourth level hierarchical arrangement. You can tag notes arbitrary number of tags, and you can organize tags into its own hierarchy as well. 

In the __Evernote Task Management System__ (let's call it __System__), we are going to use the following hierarchical structure:


<figure>
    <img src="/images/project-management/notebook-structure.png" width="500" alt="">
</figure>

We will use one main stack with various notebooks in it. The notebooks will contain the notes which are the actual projects. Each project can be assigned with tags to indicate it's id and priority.

## _PROJECTS - main stack

The whole system takes place in one separated stack called `_PROJECTS`. The leading underscore anchors the stack in the top of the notebooks list, as _Evernote_ doesn't have the possibility of manually sorting the stacks or notebooks. It simply sorts them in alphabetical order[^1].

Inside the `_PROJECTS` stack there are 7 notebooks which provide the first organization level of the __System__. As you can notice, there are leading prefixes too in front of the notebooks. These are optional, you can leave them off if you doesn't care about the alphabetical sorting. _Evernote_ will mess up the logical order of the notebooks and will use alphabetical sorting[^2].

## Notebooks

### !_admin

This notebook purpose is to contain the `project template` and the optional master `admin note`.

### !_log

Optional notebook to keep track of the daily projects on the fly. It contains only `log notes` that are created daily and named by the actual date.

### 0_pool

This notebook is the container for all of your newly created projects (`project notes`). You can put ideas you will be working on in the future here, projects that are not started yet. `Projects notes` appear here in the `creation phase`. `Project notes` remain here during the `brainstorming` phase too. As soon as you started working on it, the project moves to the `1_ongoing notebook`.

### 1_ongoing

This notebook contains the projects you are working on right now. If you choose a project from the `0_pool` or the `2_on_hold` notebooks, it enters to the `working phase`, and moves to this notebook. 

### 2_on_hold

If you cannot continue the work on a project because of the project's priority dropped or you faced a dependency problem, you put your actual project from the `1_ongoing` notebook to this notebook, and the project enters to the `hold phase`.

### 3_permament

You store the projects that will be last forever, like a workout log or a daily log of coffee intake.

### 4_completed

When you have finished a project, you put your project in this notebook, and the project will enter the `complete phase`.

### 5_obsoleted

If your project becomes obsoleted due to any reason, it enters to the `obsolete phase`, and moves to this notebook.


## Notes

There are four possible note types:

- `Admin note` (singleton)
- `Project template note` (singleton)
- `Project note`
- `Log note`

### Admin note

This is an optional note. It adds a fair bit of overhead to the administration process, but it provides a clear overview of the projects you working on/have worked on. This note only contains a table which has the following headers:

- _Project id_ - a unique id that identifies the project
- _Project link_ - you can obtain a link by _right clicking_ on the project note, and choose _Copy Note Link_
- _Project status_ - there are five states[^3] for the projects: `NOT_STARTED`, `ONGOING`, `ON_HOLD`, `DONE`, `OBSOLETED`
- _Finished_ - The date you have completed or obsolete the project.
- _Started_ - The day you pulled the project from the pool.

### Project template note

This note contains the blueprint for the new project notes you create. Using this template ensures the uniform outfit of the __System__. It contains all the parts a project administration note would need to be as effective as possible.

The template contains two main parts:

- __Header__ - where the administrative information is located
- __Body__ - where you write and collect all the information and resources you needed during the project in an grouped structure

#### Header part

The header contains the following sections:

- __Dependency__ - you can list the projects you depend on with this project, and has to finish before you can continue the current project. There is a checkbox[^4] before each note link you list in this section.
- __Corresponding projects__ - in this section you can list all of the projects you think are related to the current project but you don't depend on them. These associations helps you find solutions for a problem faster.
- __Description__ - Describe the project shortly in this section. You shouldn't write a novel though, but some summary information can help you get in context faster, if you resume the project again.
- __Brainstorming__ - Write your ideas corresponding to the project here. The only rule is: __deletion is forbidden__. You can't be sure enough that the smaller ideas won't be useful over time. Write here everything you came up with. This is not the right place for elaboration, use only a few words or sentences.
- __Associated files__ - This section keeps track of the files and folders associated with the current project. You insert a new row into a table when you add a new associated file or folder. The project root is mandatory. It is up to you to track the further files and folders located in the project root.
- __Tasks__ - In this section you keep track of the tasks of your project. Each task has an ID a name and a priority. This section is a table, where each row corresponds to a task. The rule here is similar to the rule in the brainstorming section: __deletion is forbidden__[^5]. If a task became obsoleted, simply write it down close the task, and go on with another. If you have finished a task you can check it's corresponding checkbox, and remove the priority markers from it to help yourself finding the next highest priority task to work on. This section also keeps track of the creation and last modification of the task.

#### Body part

This is the part where you elaborate your projects. You can write here any information, workarounds, solutions, code, links, images, figures you like. As mentioned before two times: __deletion is forbidden! Each project elaboration has a title, a horizontal line[^6], and the content itself. You can find the path to the importable project template note below. Import it to your `!_admin` notebook, and you are ready to go.

### Project note

You have already got familiar with the structure of the `project notes` introduced in the `project template note` description.

`Project notes` are the central parts of the __System__. They contain all the necessary information a project can correspond with. The location of the `project note` determines its state. You can drag and drop `project notes` from one notebook to another if you want to change the state of the current `project note`.

Each `project note` has a unique ID. The system keeps track of the used ID-s by tags. If you assign an ID to a project, you add a tag named after the next ID. It is up to you, how you name your ID-s. A preferable format would be the following: P00001 _(I use the __TSPR__ prefix that stands for __Tibor Simon PRoject__)_. You can increment the numbers as you create new `project notes`. By using the tag system of _Evernote_ help you find the next ID for the newly created `project note` easily. As you start typing the name of your ID format, _Evernote_ will list all of the tags matches to the typed ID-s, and you can spot the last one easily. You can spot the errors as well by adding the same ID to notes: _Evernote_ has a tag-view, where it counts all the notes that were using the tags. Each ID tags should have only one usage to keep the __System__ nice and organized.

You can set up reminders for the `project notes`, to set up due dates: The reminder list are located on the top of the notebook view containing the note you added a reminder to. If you move your project note to another notebook, the associated reminders will move to the now notebook as well.

<figure>
    <img src="/images/project-management/reminder.png" width="200" alt="">
</figure>

### Log note

If you decided to keep track of your work in the way that provides higher resolution of your progress, you should have a `!_log` notebook in your `_PROJECTS` stack, which will contain all of the `log notes`, you create in a daily manner. You gave the current date as the title for each log note.
Each log note contains sections that match to the same pattern:

- Timestamp[^7]
- Short description of the work you have just done preferably with plain text.
- Empty line

This provides a uniform outfit, a superior searchability and accountability of the work you have done.

## File system

Each project has a folder in your file system. You should put and save all the project related files in that folder. For example, if you have a project named “My project” with an ID “TASK00023”, its folder should be "TASK00023".

I use _Dropbox_ to sync my files between my machines. It is convinient to have all my project related files inside the [Dropbox_root]/_PROJECTS folder.


# Task Phases

In this section we will get familiar with the actual usage of the __System__. We will start with the summary of the different project phases, and then we are going to delve into the details of each phase.

<figure>
    <img src="/images/project-management/phases.png" width="380" alt="">
</figure>

## Phase Workflow

By using the system, each project you are working on can go through 6 phases.

 
### Creation phase

This is the phase when you create a new project note and assign a unique ID to it and do the administrative work.

### Brainstorming phase

After the creation phase, optionally you can have a brainstorming phase, where you can add ideas to the project, which might help you the work. During the work phase you are allowed to add ideas too.

### Working phase

In this phase you are working on the project. You add tasks to the actual project and keep the corresponding `log note` up to date.

### Hold phase

If you have encountered a problem, which you can't solve by your own, or you are waiting for another person, you can put the project into hold. You drag and drop the project to the `2_on_hold` notebook, and do the necessary administrative work.

### Completed phase

After you have finished the project you put the project note into the `3_completed` notebook.

### Obsolete phase

If the project became obsolete you simply drop it to the `4_obsoleted` notebook. Note that you can pull it out again if it became active again.

# Use cases

## Create a new project

When you were assigned with a new project or you came up an idea you will working on, you create and administrate a new project note. The steps are the following:

1.  Copy the content of the project note template.
1.  Create a new note in the 0_pool notebook.
1.  Name your project.
1.  Paste the copied template to the created note.
1.  Assign an ID to the note by adding a tag named after the ID.
1.  Write a short description of your project.
1.  Create a folder in your projects root folder.
1.  In the associated file section update the link  and date .
1.  In the subtask section update the “Task created” row with the current timestamp in both date fields.
1. If you have list the decencies in the dependency section.
1. If you have list the corresponding projects.
1. If you are using the admin note, create a new row into the project list, and fill out the fields (set status to NOT_STARTED).
1. If you are using log notes, log that you have created a new project.

At this point you have a project that you haven't started yet. If you have further ideas before you start, the project will enter to the brainstorming phase. After you start the project, the project will enter the working phase as it will moved to the 1_ongoing notebook.

## Add an idea for the project

If you have any idea for the project during the creation phase or the working phase or even during the hold phase, you can add ideas to the project.

1.  Write your idea in the brainstorming section of the project note into the next point.

## Remove an idea from the project

If you have thought that an idea won't work for that project, you always do the following by keeping mind the deletion is forbidden rule:

1.  Select the idea you want to remove.
1.  Change its formatting to strikethrough.

## Adding new subtask

During the work, you have finished a subtask, or just by starting the project and you want to create new subtask(s) you will be working on.

### Header part

1.  Create a new row into the subtask section by right clicking on the last row in any cell, and select Insert Row Below.
1.  Assign the next subtask ID by incrementing the last one.
1.  Put a checkbox  into the section name.
1.  Add a short name for the subtask.
1.  Assign a priority value (more @ signs means higher priority).
1.  Fill out the two date fields 
1.  Optionally you can grey out the Section created field indicating that it has to be immutable.

### Body part

1.  Below the last subtask elaboration clear out some space.
1.  Type the subtask ID.
1.  Right after that add a horizontal line .
1.  Press enter a few times.
1.  Go back and select the subtask ID above the horizontal line.
1.  Change its size to 24 pt.

Start working on a project
     When you have reached the point that you are going to start a project (whether it isn't started yet, or it is in the hold or obsoleted phase), you do the followings:

1.  Move the project note wherever it was to the 1_ongoing notebook.
1.  If you are using the admin note, change the project status to ONGOING.
1.  If you are using log notes, log that you have started a new subtask.

## Finish working on a subtask

When you finish your work on a subtask (it doesn't matter if you have finished it completely or just start something else) you can do the followings:

1.  Update the Last modified field in the project note's header section for the current subtask with the current timestamp.
1.  If you are using log notes, log that you have finished work on a subtask.

## Putting a project to hold

If you stuck with the current project you working in, you can put in hold, while you waiting to be able to continue the work.

1.  Update the Last modified field in the project note's header section for the last subtask you have worked on with the current timestamp.
1.  Move the project note to the 2_on_hold notebook by drag and drop.
1.  If you are using the admin note, change the project status to ON_HOLD.
1.  If you are using log notes, log that you have put a project on hold.

## Finish a project

At the point when you have finished your project, you have to do the followings:

1.  Update the Last modified field in the project note's header section for the last subtask you have worked on with the current timestamp.
1.  Move the project note to the 3_completed notebook by drag and drop.
1.  If you are using the admin note, change the project status to DONE.
1.  If you are using log notes, log that you have finished a project.

## Finding the next subtask to work on

If you have finished your current subtask and you want to start the highest priority one:

1.  Scroll through the Subtask section, and find the row with the most @ signs in it.

## Obsolete a project

If you were told that your project is obsolete now, you should put the project into the obsolete state:

1.  Update the Last modified field in the project note's header section for the last subtask you have worked on with the current timestamp.
1.  Move the project note to the 4_obsoleted notebook by drag and drop.
1.  If you are using the admin note, change the project status to OBSOLETED.
1.  If you are using log notes, log that you have obsoleted a project.

## Starting the day

When you are about to start your day..

1.  If you are using log notes, create a new note in your !_log notebook, and name it according to the actual date.
1.  Go into the newly created note, and insert the current timestamp 
1.  Type in shortly that you have started your work, and what is the first project of the day.





[^1]: Don't be confused, if you created a notebook or a stack, and it's not sorted by alphabetical order. This is a bug in _Evernote_. It will be sorted after a restart..

[^2]: Without the prefixes the order will be the following: admin, completed, log, obsoleted, on_hold, ongoing, pool.

[^3]: Don't be confused. There are phases and states according to notes. The phases describes the actions you may do during your work. The status is just an indicator for the current state of the project, and only used int he admin note.

[^4]: Press Ctrl+Shift+C to insert a checkbox.

[^5]: I repeat myself: you cannot be sure enough to delete information you have wrote down already. Disk space is not a problem today.

[^6]: Press Ctrl+Shift+- to insert a horizontal line on the go.

[^7]: Press Shift+Alt+D to insert the actual timestamp.