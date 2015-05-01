---
layout: post
title: Solarized theme for embedded Gists
categories: ['tools']
tags: ['jekyll', 'web']
published: True
---

I am a big fan of the [solarized](http://ethanschoonover.com/solarized) color theme. I use it wherever I can, and my embedded code snippets on my site aren't an exception. In this article I will demonstrate a method that will turn your [gist's](gist.github.com) normal style into a much more elegant solarized one.

## Early solution and motivation

I was looking for the best way to post source code on my Jekyll based site[^1]. Since the Jekyll sites use [Markdown](http://en.wikipedia.org/wiki/Markdown) or [Kramdown](http://kramdown.gettalong.org), it is a pretty reasonable first thought that using the provided syntax highlighting methods will be sufficient enough to use.

I am using the [HPSTR](https://github.com/mmistakes/hpstr-jekyll-theme) jekyll theme hosted on [Github Pages](https://pages.github.com). The theme uses Kramdown to process the markdown text, and [Pygments](http://pygments.org) to handle the syntax colorings. To get the desired solarized theme, I just had to create a custom css file.

After a few hours later, I came up with the custom `_pygments.css` file. I started to write this article, and bang.. I randomly tested the article by pushing it to GitHub, and I was sent by a nice letter about a page build failure..

<blockquote>
The page build failed with the following error:

The file `assets/css/main.scss` contains syntax errors. For more information, see https://help.github.com/articles/page-build-failed-markdown-errors.
<cite>GitHub Pages staff</cite>
</blockquote>

My investigation resulted, that the css source code I tried to showcase in the article causing the problems. Since the css code contains classes called `.highlight` it conflicted with the _Liquid tags of the syntax highlighting blocks. Bummer. I am using GitHub Pages for hosting, so I can not modify the compilation tools. I need an other way to present source code on my site.


## Using Gists

On my previous Wordpress based site I used Gists as source code showcase tool. I found that this is the bast way among the others that uses various Wordpress plugins.

Gists provides a perfect versioned way to showcase codes. It has one downside though. It looks a bit outdated for me. I don't like the pure white background, the dark font colors, and the sharp corners.

####It's time for a heavy CSS refactoring. 

Using the `!important` CSS declaration it is possible to overwrite the default rules downloaded as an external CSS file. My Jekyll configuration uses [SASS](http://sass-lang.com) so I was able to use CSS variables.

The biggest problem during the refactoring was that Pygments and the syntax colorer used by Gist uses a completely different CSS class system.

## Solution with SASS

The predefined variables for the syntax coloring provides a very convinient way

| Pygments classes   |      Gist classes      |
|:--------:|:-------------:|
|.hll .c .err .g .k .l .n .o .x  | .pl-c .pl-c1 .pl-mdh .pl-mm .pl-mp |
|.p .cm .cp .c1 .cs .gd .ge .gr  | .pl-mr .pl-s1 .pl-v .pl-s3 .pl-sc  |
|.gh .gi .go .gp .gs .gu .gt .kc | .pl-sv .pl-e .pl-en .pl-s1  .pl-s2 |
|.kd .kn .kp .kr .kt .ld .m .s   | .pl-smi .pl-smp .pl-stj .pl-vo     |
|.na .nb .nc .no .nd .ni .ne .nf | .pl-vpf .pl-ent .pl-k .pl-s .pl-st |
|.nl .nn .nx .py .nt .nv .ow .w  | .pl-pds .pl-s1 .pl-s1  .pl-pse     |
|.mf .mh .mi .mo .sb .sc .sd .s2 | .pl-s2 .pl-sr .pl-sr  .pl-cce      |
|.se .sh .si .sx .sr .s1 .ss .bp | .pl-sr  .pl-sra .pl-sr  .pl-sre    |
|.vc .vg .vi .il                 | .pl-src .pl-mo .pl-v .pl-id .pl-ii |
|                                | .pl-sr  .pl-cce .pl-ml .pl-mh      |
|                                | .pl-mh .pl-en .pl-ms .pl-mq .pl-mi |
|                                | .pl-mb .pl-md .pl-mdhf .pl-mdht    |
|                                | .pl-mi1 .pl-mdr                    |













{% gist tiborsimon/2479af323b7af1381a35 %}

[^1]: If you are not familiar with the story, I have switched from Wordpress to Jekyll. The reason was simple: Wordpress is a fantastic platform with lots and lots of customizations, but it has a major _(and a few smaller)_ drawback: it is dynamic. I.e. it is slow as hell.. It can be attacked and hacked too, it has WYSIWYG editor which sucks, versioning is almost impossible with it. I am going to write a whole article about my switch.

