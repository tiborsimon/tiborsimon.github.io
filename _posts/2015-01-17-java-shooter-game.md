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

<iframe width="640" height="360" src="https://www.youtube.com/embed/dUKqIYJZlOk" frameborder="0" allowfullscreen></iframe>

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

<figure>
    <img src="/images/java-shooter/javashooter-1.png" alt="" width="550" />
</figure>


# Game menu

In the New Game Menu you can start Easy, Normal and Expert game.

- Easy – slow enemies with slow spawning time + auto aiming
- Normal – faster enemies with faster spawning time + auto aiming
- Expert – slow enemies with slow spawning time + manual aiming (very hard!)

<figure>
    <img src="/images/java-shooter/javashooter-2.png" alt="" width="550" />
</figure>

# Player menu

In the Player Menu you can view the stats of the current player, export your player data, and create new player.

- Export – it exports the current player stats to transfer them another computer.
- New – it goes to the New Player Menu

<figure>
    <img src="/images/java-shooter/javashooter-3.png" alt="" width="550" />
</figure>

# Controlling the game

The game follows the conventions: you can move with the arrow keys, and fire with the `space bar`. In _Easy_ and _Normal_ mode the game aims for you, but in _Expert_ mode aiming is your task with `T` and `H` keys.

During the game the mouse pointer disappears (in mac you have to move the pointer a bit unless it won’t disappear). With the `ESC` key you can bring up the Pause Menu, and the mouse pointer will show up again.

# Modding the gameplay

I have built in the possibility to mack around with the main game parameters. To do this you have to create a text file called mods_for_the_game.txt into the same folder where the jar file located.

## Hackable parameters

- fullscreen [true/false] – the game can load in window or full screen mode.
- overclock [fps in int] – sets the target fps. The actual fps is dependent on your machine.
- showFPS [true/false] – turns the fps counter on or off
- explosionPoolLimit [pool limit in int] – it is expensive to allocate many animation frames in real time, therefore the game allocates the explosion animation frames before the game starts. You can set the max number of animations preloaded to the animation pool. For high FPS rate it is recommended to set this value greater than 10. The game will load slower but it wont crash due to empty animation pool.
- sparkPoolLimit [pool limit in int] – same as the explosionPoolLimit parameter. If you set high FPS rate set this value higher than 10.

The syntax is very simple. First you type the keyword you want to modify (not case sensitive), space, then the value. This is a modifying block. You can use more blocks at once separated them with spaces.

__If the game crashes, make sure you set the pool limits higher than 10!__

For example lets say you want to set higher FPS rate than the default 60 fps, and you want to play the game in full window mode with the FPS counter displayed. You have to create the mods_for_the_game.txt file next to the jar file.
The content of the text file in this case should be like this:

{% gist tiborsimon/bb949b0256f7b003055b %}

Example video about how to overclock the game a bit.

<iframe width="640" height="360" src="https://www.youtube.com/embed/L5NhA_ajQ_w" frameborder="0" allowfullscreen></iframe>


# Summary

The developed program isn't a full featured game but a skeleton, which you can develop further.

{% include repo_and_release.html %}

