---
layout: post
title: Solarized theme for embedded Gists
categories: ['tools']
tags: ['jekyll', 'web']
published: True
---

I am a big fan of the [solarized](http://ethanschoonover.com/solarized) color theme. I use it wherever I can, and my embedded code snippets on my site aren't an exception. In this article I will demonstrate a method that will turn your [gist's](gist.github.com) casual style into a much more elegant solarized one.

# The motivation

I was looking for the best way to post source code on my Jekyll based site[^1]. Since the Jekyll sites use [Markdown](http://en.wikipedia.org/wiki/Markdown) or [kramdown](http://kramdown.gettalong.org), it is a pretty reasonable first thought that using the provided syntax highlighting methods will be sufficient to use, but let's sum up all of the possibilities:

- Buildt in Markdown/Kramdown support
    - inline code highlight
    - fenced code highlight
- Liquid code highlights
- Octopress flavored Backtick Code Blocks
- 3rd party sourcecode sharing systems like Github Gists



{% gist tiborsimon/2479af323b7af1381a35 %}

[^1]: If you are not familiar with the story, I have switched from Wordpress to Jekyll. The reason was simple: Wordpress is a fantastic platform with lots and lots of customizations, but it has a major _(and a few smaller)_ drawback: it is dynamic. I.e. it is slow as hell.. It can be attacked and hacked too, it has WYSIWYG editor which sucks, versioning is almost impossible with it. I am going to write a whole article about my switch.

