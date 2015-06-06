---
layout: post
title: Java Shooter Game
categories: ['programming']
tags: ['java', 'game']
published: True
repo_link: https://github.com/tiborsimon/JavaShooterGame
dowload_link: https://github.com/tiborsimon/JavaShooterGame/archive/v1.2.zip
version: v1.2
---

During the last semester I had a subject that required to create a java program. I decided to write a small game similar to Minigore. The game is written in java with LWJGL and Slick2D game libraries.

<iframe width="560" height="315" src="https://www.youtube.com/embed/dUKqIYJZlOk" frameborder="0" allowfullscreen></iframe>

It uses some open source stuff, like the explosion animation and the music for the promo video. The game is open source, so you can go to GitHub to see how the game functionalities were implemented.

{% include repo_and_release.html %}

If the game won’t open by clicking on it (like on OSX Moutain Lion), you have to open it from command line. If the command line returns an error like pixel format not accelerated, you should check out these sites for the solution.

{% gist tiborsimon/b052b74db0fdc360a885 %}

# Main menu

In the Main Menu you have 4 options but in reality 3 of them is working right now.

- Play – it goes t the new game menu
- Player – it goes to the player menu
- Scores – currently not working
- Exit – it exits the game

<img src="/images/java-shooter/javashooter-1.png" alt="" width="500" />

# 

<iframe width="560" height="315" src="https://www.youtube.com/embed/L5NhA_ajQ_w" frameborder="0" allowfullscreen></iframe>

