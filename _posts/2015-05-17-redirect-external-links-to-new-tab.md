---
layout: post
title: Redirect external links to new tab
categories: ['web']
tags: ['jekyll', 'hack', 'javascript']
published: True

---

As Jekyll uses Markdown to render it's contents, and Markdown doesn't support control over the hyperlink target attribute, you were forced to write your external links and references manually. Or not? Hopefully, there is a simple javascript hack, that can redirect your external links to a new blank tab.

All the credits go to [Austin](http://stackoverflow.com/users/1504966/austin) and to his [stackoverflow post](http://stackoverflow.com/a/11597448). I am just a happy user of this method :)

{% gist tiborsimon/78f71b14d1436e867354 %}

The method just works. Nothing fancy about it, it does what is supposed to do. Thank you Austin!

<iframe id="iframe_container" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" width="640" height="500" src="https://prezi.com/embed/6rhitvt0sgm4/?bgcolor=ffffff&amp;lock_to_path=0&amp;autoplay=0&amp;autohide_ctrls=0&amp;landing_data=bHVZZmNaNDBIWjNxWlNQcmg2RlRPRkRDcStneXhHNGR6WHU1bVZ5U0JEdTBlekYrUGhWUGc1YWQvZz09&amp;landing_sign=QaQM7NPEWdsIHhunk2NxSnrkQSM86x2KSvMELf6k32w#"></iframe>
