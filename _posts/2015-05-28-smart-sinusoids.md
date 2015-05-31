---
layout: post
title: Smart Sinusoids
categories: ['tools']
tags: ['matlab']
published: True

---

The easiest way to generate a sine or cosine signal in MATLAB. With this library there are almost infinite ways to describe and generate a sinusoid signals. 

<a href="http://tiborsimon.github.io/tools/solarized-theme-for-embedded-gists/" target="_blank"><img src="http://tiborsimon.github.io/images/core/corresponding-article.png" /></a>   <a href="http://tiborsimon.github.io/tools/solarized-theme-for-embedded-gists#discussion" target="_blank"><img src="http://tiborsimon.github.io/images/core/join-to-the-discussion.png" /></a>   <a href="http://tiborsimon.github.io/tools/solarized-theme-for-embedded-gists#demo" target="_blank"><img src="http://tiborsimon.github.io/images/core/live-demo.png" /></a>

# Generating sinusoids

Generating a sinusoid signal is often the first step for a more complex computations. It should be a routine, but actually it isn't. Many people struggles with it.

### The old way

The equation of a sinusoid signal is a known fact:

<img src="http://upload.wikimedia.org/math/9/5/0/95070ea56bf2d63142b522d0e1c34d5d.png">

However. This equation is only valid in the __continuous time__ domain, therefore without any modification it is useless in the __discrete time__ domain used by every digital machine. You won't be able to create a continuous variable that spans through the duration of the signal from the beginning to the end while taking up every possible value.

Machines work with _discrete time series_ that has a new property called __resolution__. Resolution is the link between _continous_ and _discrete_ time domain. This property is implemented with __sampling__. It tells us how many data points were sampled equidistantly from the continuous signal within a time segment. In this way we can represent a continuous signal with discrete data point[^1].

Therefore the _t_ variable in the equation can be represented as a vector of data points. 

To create such a data point vector, you have to choose a sampling interval. Let's say you want to use __10 samples per seconds__ (`fs=10Hz`), and you want to have __20 samples__ in your vector. That also means that your time vector will cover __2 seconds__ of continuous time. As you can see, the given duration in continuous time is equivalent with the given number of samples if the sampling frequency is known.

{% gist tiborsimon/619da807c9fe3892eaac %}



[^1]: Of course this is a very high level overview of the [sampling theorem](http://en.wikipedia.org/wiki/Nyquist–Shannon_sampling_theorem). There are much more detail how these things really work.
