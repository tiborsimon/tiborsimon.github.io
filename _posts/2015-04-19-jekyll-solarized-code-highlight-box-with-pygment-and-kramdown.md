---
layout: post
title: Jekyll solarized code highlight box with pygment and kramdown
categories: ['programming']
tags: ['jekyll', 'web']
published: True

---

{% highlight css linenos=table %}
{% raw %}
table.highlighttable {
  border-collapse: separate;
  border-spacing: 0;
  @include rounded(6px);
  @include box-shadow(0 2px 5px rgba(0, 0, 0, 0.09));
  overflow: hidden;
  margin-bottom: 25px;
  border: 1px solid rgba(147, 161, 161, 0.55);
}
table.highlighttable td {
  padding: 0;
}
{% endraw %}
{% endhighlight %}

