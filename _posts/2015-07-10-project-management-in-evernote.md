---
layout: post
title: Project Management in Evernote
categories: ['tools']
tags: ['evernote', 'task', 'management']
published: True

---

Evernote is an application for keeping your ideas and notes synchronized between your various devices. You can create notes in notebooks, and you can assign tags on them. If you sacrifice some time overhead you can extend Evernote's functionality to create a complete task management system. 

With this article you will be able to use Evernote as a task management system. This system offers you the followings:

- Keep track of your tasks
- Keep the tasks and the corresponding knowledge in one place
- Manage task dependencies
- Set up reminders and due dates
- Keep your files organized and in association with the tasks

# Warning!

There are some administrative overhead though, which you have to count with if you decide to apply this method. The extra time will pay back, as it results a clear and traceable reference of your work.

# Hierarchical structure

In Evernote there are three basic hierarchical levels:

- Notes - the basic building blocks
- Notebooks - contains arbitrary number of notes
- Stacks - contains arbitrary number of notebooks

Above the basic hierarchical organization there is the tag system which provides a finer, fourth level of hierarchical arrangement. You can tag notes arbitrary number of tags, and you can organize tags into its own hierarchy as well. 

In the Evernote Task Management System (let's call it System), we are going to use the following hierarchical structure:

- _PROJECTS
    - !_admin
    - !_log 
    - 0_pool 
    - 1_ongoing 
    - 2_on_hold 
    - 3_completed 
    - 4_obsoleted 


## _PROJECTS - main stack

The whole system takes place in one separated stack called `_PROJECTS`. The leading underscore anchors the stack in the top of the notebooks list, as Evernote doesn't have the possibility of manually sorting the stacks or notebooks. It simply sorts them in alphabetical order[^1].

Inside the `_PROJECTS` stack there are 7 notebooks which provide the first organization level of the System. As
you can notice, there are leading prefixes in front of the notebooks. These are optional, if you doesn't
care about the alphabetical sorting of Evernote, which will mess up the logical order of the notebooks[^2].

## Notebooks

### !_admin

This notebook purpose is to contain the `task template` and the optional master `admin note`.

### !_log

Optional notebook to keep track of the daily tasks on the fly. It contains only `log notes` that are created daily and named by the actual date.

### 0_pool

This notebook is the container for all of your newly created projects (`project notes`). You can put here ideas you will be working on in the future, projects that are not started yet. Projects notes appear here in the `creation phase`. Project notes remain here during the `brainstorming` phase too. As soon as you started working on it, the task moves to the `1_ongoing notebook`.

### 1_ongoing

This notebook contains the projects you are working on right now. If you choose a project from the `0_pool` or the `2_on_hold` notebooks, it enters to the `working phase`, and moves to this notebook. 

### 2_on_hold

If you cannot continue the work on a project because of the project's priority dropped or you faced a dependency problem, you put your actual project from the `1_ongoing` notebook to this notebook, and the task enters to the `hold phase`.

### 3_completed

When you have finished a project, you put your task in this notebook, and the task will enter the `complete phase`.

### 4_obsoleted

If your task becomes obsoleted due to any reason, it enters to the `obsolete phase`, and moves to this notebook.


## Notes

There are four possible note types in the System.

- Admin note (singleton)
- Project template note (singleton)
- Log note
- Project note

### Admin note

This is an optional note. It adds a fair bit of overhead to the administration process, but it provides a clear overview of the task you working on/have worked on. This note only contains a table which has the following headers:

- Task id - a unique id that identifies the task
- Task link - you can obtain a link by right clicking on the task note, and choose Copy Note Link
- Task status - there are five states[^3] a task can be in: NOT_STARTED, ONGOING, ON_HOLD, DONE, OBSOLETED
- Finished - The date you have completed or obsolete the task.
- Started - The day you pulled the task from the pool.

### Task template note

This note contains the blueprint for the new task notes you create. Using this template ensures the uniform outfit of the System. It contains all the parts a task administration note would need to be as usable as possible.

The template contains two main parts:

- Header - where the administrative parts are located
- Body - where you write and collect all the information and resources you needed during the task in an grouped structure

#### Header part

The header contains the following sections:

- Dependency - you can list the tasks you depend on this task, and has to finish before you can continue the current task. There is a checkbox[^4] before each note link you list in this section.
- Corresponding tasks - in this section you can list all of the tasks you think are related to the current task but you don't depend on them. These associations helps you find solutions for a problem faster.
- Description - Describe the task shortly in this section. You shouldn't write a novel though, but some summary information can help you get in context faster, if you pulling the task again.
- Brainstorming - Write your ideas corresponding to the task here. The only rule is: deletion is forbidden. You can't be sure enough that the smaller ideas won't be useful over the time. Write here everything you came up with. This is not the right place for the elaboration, use only a few words and sentences.
- Associated files - This section keeps track of the files and folders associated with the current task. You insert a new row into a table when you add a new associated file or folder. The task root is mandatory. It is up to you to track the further files and folders located in the task root.
- Subtasks - In this section you keep track of the subtask of your task. Each subtask has an ID, a name and a priority. This section is a table, where each row corresponds to a subtask. The rule here is similar to the rule in the brainstorming section: deletion is forbidden[^5]. If a subtask became obsoleted, simply write it down close the subtask, and go on with another. If you have finished a subtask you can check it's corresponding checkbox, and remove the priority markers from it to help yourself finding the next highest priority subtask to work on. This section also keeps track of the creation and last modification of the subtask.

#### Body part

This is the part where you elaborate your subtasks. You can write here any information, workarounds, solutions, code, links, images, figures you like. As mentioned before two times: deletion is forbidden! Each subtask elaboration has a title, a horizontal line[^6], and the content itself. You can find the path to the importable task template note below. Import it to your !_admin notebook, and you are ready to go.

### Log note

If you decided to keep track of your work in the way that provides higher resolution, you will have a !_log notebook in your `_PROJECTS` stack, which will contain all of the log notes, you create in a daily manner. You gave the current date as the title for each log note.
Each log note contains sections that match to the same pattern:

- Timestamp[^7]
- Short description of the work you have just done preferably with plain text.
- Empty line

This provides a uniform outfit and a superior search-ability and accountability of the work you have done.

### Task note

You have already got familiar with the structure of the task notes introduced in the task template note description.

Task notes are the central parts of the System. They contain all the necessary information a task can correspond with. If you were assigned with a task, you create a task note, fill out the header sections, and start working on the task. The location of the task note determines its state. You can drag and drop task notes from one notebook to another if you want to change the state of the current task note. Each task note has a unique ID. The system keeps track of the used ID-s by tags. If you assign an ID to a task, you add a tag named after the next ID. It is up to you, how you name your ID-s. A preferable format would be the following: TASK00001. You can increment the numbers as you create new task notes. By using the tag system of Evernote help you find the next ID for the newly created task note. As you start typing the name of your ID format, Evernote will list all of the tags matches to the typed ID-s, and you can spot the last easily. You can easily spot the errors by adding the same ID to notes: Evernote has a tag-view, where it counts all the notes that were using the tags. Each ID tags should have only one usage to keep the System nice and organized.
You can set up reminders for the task notes, to set up due dates:

The reminder list are located on the top of the notebook view containing the note you added a reminder to. If you move your task note to another notebook, the associated reminders will move to the now notebook as well.

## File system

Each task has a folder in your file system. You should put and save all the task related files in that folder. The name of the folder could be the following[^8]:

`[task ID]_[Task name with underscores]`

For example, if you have a task named “My task” with an ID “TASK00023”, its folder should be TASK00023_My_PROJECTS. The preferable location of the task root folder is here: d:\_PROJECTS\

## Summary

In this section you have got familiar with the structure of the System: the three level hierarchical system, and the elements taking place in each level. The following section will contain the use cases for the System. Based on the current knowledge and the next one you will gather in the next section you will be able to fully adopt the System, and start using it.




[^1]: Don't be confused, if you created a notebook or a stack, and it's not sorted by alphabetical order. This is a bug in Evernote. It will be sorted after a restart..

[^2]: Without the prefixes the order will be the following: admin, completed, log, obsoleted, on_hold, ongoing, pool.

[^3]: Don't be confused. There are phases and states according to notes. The phases describes the actions you may do during your work. The status is just an indicator for the current state of the task, and only used int he admin note.

[^4]: Press Ctrl+Shift+C to insert a checkbox.

[^5]: I repeat myself: you cannot be sure enough to delete information you have wrote down already. Disk space is not a problem today.

[^6]: Press Ctrl+Shift+- to insert a horizontal line on the go.

[^7]: Press Shift+Alt+D to insert the actual timestamp.

[^8]: You are on your own naming your folders, but keep in mind that using the task ID sin the folder names will help you find the desired content much more easily.