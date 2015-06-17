---
layout: post
title: MATLAB Library System
categories: ['programming']
tags: ['matlab']
published: True
repo_link: https://github.com/tiborsimon/MATLAB-Library-System-template
dowload_link: https://github.com/tiborsimon/MATLAB-Library-System-template/archive/v1.1.1.zip
version: v1.1.1
---

Have you ever became angry due to the path handling in MATLAB. If you do, this project could be interesting for you.

{% include repo_and_release.html %}

# MATLAB Library System

Library handling module that makes adding and removing your MATLAB scripts and functions convenient.

 <a href="http://tiborsimon.github.io/programming/matlab-library-system/" target="_blank"><img src="http://tiborsimon.github.io/images/core/corresponding-article.png" /></a>   <a href="http://tiborsimon.github.io/programming/matlab-library-system/#discussion" target="_blank"><img src="http://tiborsimon.github.io/images/core/join-to-the-discussion.png" /></a>

## Using the system

### Manual way

1. Create a new folder that will be the root folder of your project.
1. Copy the content of this repository into that folder.
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by running the `install.m` script.

### Command line way

1. Clone this repository to your system:<br />
   `git clone git@github.com:tiborsimon/MATLAB-Library-System.git my_library`<br />
   You can edit the folder name according to your needs.
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by running the `install.m` script.

## Folder structure

__MATLAB Library System__ has got a simple folder structure.

```
mylib                           | top level folder of your library 
│  install.m                    | add your library to the MATLAB path
│  unistall.m                   | remove your library to the MATLAB path
│  README.md                    | you can edit this readme file optionally
│  LICENSE                      | add your license here optionally
│                               | 
├─.core_system                  | core functionality folder
│     core_checkenvironment.m   | core helper script should not be modified
│     core_getlibrarydata.m     | core helper script should not be modified
│     librarydata               | edit your library name and version here
│                               | 
└─library                       | all your code goes here
      mylib_dummytest.m         | dummy deletable function for installation testing
```

## Changing the library's name and version

If you want to modify your library's name and version, you can edit the `mylib/.core_system/librarydata` file according to your needs. The first row contains the library name and the second row contains the library version.

The default `librarydata` file looks like this:

```
My Library
v1.0
```

By modifying this file, the installer and uninstaller script will print the new name and version implicitly.

```
>> install
 
My Library v1.0 has been successfully installed on your system!
```


## Possible use case

You can put your every project into a __MATLAB Library System__ so you can manage them separately by installing or uninstalling them on demand. You can ship your projects to others in a nice and isolated way too. No more hassle with the MATLAB path. Your customer just runs the install script and your project is ready to use. 

_Less friction in the customer side equals happier customers :)_



