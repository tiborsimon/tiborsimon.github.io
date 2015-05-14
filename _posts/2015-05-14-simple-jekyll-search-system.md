---
layout: post
title: Simple Jekyll search system
categories: ['category']
tags: ['jekyll', 'web', 'css']
published: True

---

Searching on a static website? Yep, it can be done easily. The only things you need is a static database, and a searching algorithm. This article describes the necessary steps to create a lightning fast good looking search system for your Jekyll based site. This method is also compatible with the GitHub Pages hosting service.

I was looking for the best possible solution to integrate a search system for my Jekyll site. The original idea came from the designer of the theme I am using right now. He created another theme called [So Simple](https://mademistakes.com/work/so-simple-jekyll-theme/) that features a search functionality. For me the fact that a static site can have such a search system was marvelous. I started a research on how to create these systems.

## Basic construction 

I have found a few implementations, but among few differences, every method was based around three main pillar.

1. Generated _json_ file acts as a static database
1. A _javascript_ based algorithm provides the search functionality

