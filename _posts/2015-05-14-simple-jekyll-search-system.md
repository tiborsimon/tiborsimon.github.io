---
layout: post
title: Simple Jekyll search system
categories: ['tools']
tags: ['jekyll', 'web', 'css', 'plugin']
published: True

---

Searching on a static website? Yep, it can be done easily. The only things you need is a static database and a searching algorithm. This article describes the necessary steps to create a lightning fast good looking search system for your Jekyll based site. This method is also compatible with GitHubPages.

I was looking for the best possible solution to integrate a search engine into my Jekyll site. The original idea came from the designer of the theme I am using right now. He created another theme called [So Simple](https://mademistakes.com/work/so-simple-jekyll-theme/) that features a search functionality. For me the fact that a static site can have such a search system was marvelous. I started a research on how to create these systems.

# Existing solutions 

There are already a few implementations which provide a solid base for my project. The existing implementations are the following[^1]:

- [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) by _Christian Fei_
- [Jekyll + lunr.js](https://github.com/slashdotdash/jekyll-lunr-js-search) by _slashdotdash_
- [Jekyll search with JSON](http://mathayward.com/jekyll-search/) by _Mat Hayward_  
- [Jekyll search](https://github.com/mathaywarduk/jekyll-search) by _mathaywarduk_

Among few differences, every method was based around three main pillar:

1. Generated _json_ file acts as a static database
1. A _javascript_ based algorithm provides the search functionality
1. A trigger mechanism that fires the search command with the given keyword

## Static database

Every method use the same technique to create a static database. They are generating a `.json` file based on the site's content with _ruby_ or _liquid_ script. The file is generated during site compilation so getting the database data is equivalent as downloading a script file from the hosting server.

The `.json` file content is configured by the user. It can be contain any data you can set for a post or other searchable objects on the site. With this file the search engine can match tags, categories, titles, dates, excerpts or the entire post content as well. Very usable feature.

## Searching algorithm

Because we are dealing with static sites, the only considerable method for a search algorithm has to be a client side technology. For this purpose, the implementations use _javascript_. There are various scripts available providing a search API. There are [lunr.js](http://lunrjs.com), and custom tailor made solutions: [this](https://github.com/alexpearce/alexpearce.github.com/blob/master/assets/js/alexpearce.js) and [this](https://alexpearce.me/2012/04/simple-jekyll-searching/#disqus_thread).

## Trigger mechanism

There are two solutions for this problem:

- the traditional one that uses a search button to trigger the search event
- the instantaneous one that provides the search result immediately, based on a _javascript_ or _AJAX_ event

All mechanism are basic web development techniques, so nothing special here neither.

# Existing solution summary

The existing solutions are fine, but they introduce unwanted dependencies like: bowser, new ruby gem. These could be useful someone, but for me, they are just headaches..

# My solution

The existing solutions are fine, but neither of them suffice my requirements:

1. __Instantaneous__ - search results should appear during typing
1. __Standard behavior__ - be able to respond keystrokes: arrows and esc key
1. __Transparent design__ - the search field should be an organic part of the existing design

My starting point was _Christian Fei's_ [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) project. This provided an instantaneous response as you typed in the search field.

## 1. Instantaneous

As you can see on [Chris' demo page](http://christian.fei.ninja/Simple-Jekyll-Search/), the search system responds immediately as you start typing. This is what I want. As less friction as I can get. If you have to press an additional button to list the results, that is an unnecessary extra action.. As the database is statically in a file, there is no point to force the user to click a button.

Chris' solution contains the basic structure that provides this feature. He uses a minified javascript file that can capture the real time input of a dedicated input field, and produce output to a dedicated place on your site.

{% gist tiborsimon/b1ea90fc8623fb5cd668 %}

Check out the [Simple Jekyll Search repository](https://github.com/christian-fei/Simple-Jekyll-Search) for more details of the editable parameters.

To create a static database, I use the same solution as every other implementation do: a skeleton `.json` file with _Liquid_ and _Front Matter_.

{% gist tiborsimon/5ae2d5fa3f6a2c6b3ec5 %}

If you want to add more fields, make sure you stript the html with _Liquid_. Also keep in mind that your file have to be `json` compliant.


## 2. Standard behavior

If I am using a search field I expect a standard behavior from it:

1. Be able to navigate between the results with the `UP` and `DOWN` arrow keys.
1. Be able to abort the whole search procedure by pressing the `ESC` key.

The small script I came up with provides this features. You can try out the raw version:

<iframe width="100%" height="300" src="//jsfiddle.net/Vtn5Y/870/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

This script responds to the `UP`, `DOWN`, `ESC` and `ENTER` key events. You can select the search results with the `UP` and `DOWN` keys, choose the selected result by pressing `ENTER`, and abort the search with `ESC`. By selecting a result with the arrow keys, the script assigns a custom CSS class to the selected result, which makes it selected visually.

To make the search engine compatible with this script, I had to make it not to response to the `UP` and `DOWN` during navigation. This was necessary, as the search engine refreshes the result content on every key strokes, and overrides the assigned selection CSS classes, and the selection goes away.

There is an editable _wrap around_ parameter which makes it possible to stop the selection at the top and bottom of the result array, or to wrap around by demand.

## 3. Transparent design

To create a fully blended in design I used these CSS rules for the project:

{% gist tiborsimon/8015a8cb0311d6d16024 %}

The search functionality is available only on the main page. I saw no reason to make it accessible on other pages.

# Summary

You can test the finished search engine on the main page of this site. If you satisfied with it, you can adopt to your own Jekyll site by forking it's GitHub repository.

<a href='https://github.com/tiborsimon/jekyll-search-system' class="btn-info btn centered"><i class="fa fa-github-alt"></i> Go to GitHub repository</a>

---
[^1]: At least I have found these ones during my research





