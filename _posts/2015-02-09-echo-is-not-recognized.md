---
layout: post
title: '.echo' is not recognized..
categories: ['category']
tags: ['tag']
published: True

---

> 'echo.' is not recognized as an internal or external command, operable program or batch file.  Sounds familiar? Sometimes what worked one minute before decide to not to work anymore. In this situation you just scratch your head and tediously trying to find the solution. Finally, when you solved the problem, and realize that it was one of the dumbest error you have ever made, nothing is left for you but head banging.. I have faced a similar program in the days.. I am working on a build script at work that uses DOS commands to build our *manually-slow-to-build-but-everyone-is-building-it-that-way* product. Between two commits it happened that the script that worked before flawlessly has stopped to work.. Even the `echo.`  command won't work. I had no idea what happened, so I opened up the browser, and start searching for the solution. A few minutes later I came up with the solution: During the development I successfully reversed a file append operator two parameters. I accidentally wrote `%my_file% >> echo.`  instead of `echo. >> %my_file%`  so the interpreter created an echo file to the working folder. With that file in the working folder, the interpreter won't recognize the command echo that is called exactly the same as the file.. I delete that file between two facepalms, and everything worked again as it should be..


- Always check your diff between the current state and a previously committed (hopefully working) state.
- Make sure to __delete__ all __accidentally created files__ if you spot this kind of mistake.