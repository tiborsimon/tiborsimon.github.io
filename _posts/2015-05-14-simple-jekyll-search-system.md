---
layout: post
title: Simple Jekyll search system
categories: ['category']
tags: ['jekyll', 'web', 'css']
published: True

---

Searching on a static website? Yep, it can be done easily. The only things you need is a static database and a searching algorithm. This article describes the necessary steps to create a lightning fast good looking search system for your Jekyll based site. This method is also compatible with the GitHub Pages hosting service.

I was looking for the best possible solution to integrate a search system into my Jekyll site. The original idea came from the designer of the theme I am using right now. He created another theme called [So Simple](https://mademistakes.com/work/so-simple-jekyll-theme/) that features a search functionality. For me the fact that a static site can have such a search system was marvelous. I started a research on how to create these systems.

## Basic construction 

There are already some implementations which provided a solid base for my project. The existing implementations are the following[^1]:

- [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) by _Christian Fei_
- [Jekyll + lunr.js](https://github.com/slashdotdash/jekyll-lunr-js-search) by _slashdotdash_
- [Jekyll search with JSON](http://mathayward.com/jekyll-search/) by _Mat Hayward_
- []()

I have found a few implementations, but among few differences, every method was based around three main pillar.

1. Generated _json_ file acts as a static database
1. A _javascript_ based algorithm provides the search functionality
1. A trigger mechanism that fires the search command with the given keyword


[^1]: At least I have found these ones during my research





