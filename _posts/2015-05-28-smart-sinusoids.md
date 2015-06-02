---
layout: post
title: Smart Sinusoids
categories: ['programming']
tags: ['matlab']
published: True

---

The easiest way to generate a sine or cosine signal in MATLAB. With this library there are almost infinite ways to describe and generate a sinusoid signals. 

# Generating sinusoid signals

Generating sinusoid signals is often the first step for executing a more complex computation. It should be a routine, but actually it isn't. Many people struggles with it.

## The problem

The equation of a sinusoid signal is a known fact:

<img src="http://upload.wikimedia.org/math/9/5/0/95070ea56bf2d63142b522d0e1c34d5d.png">

However. This equation is only valid in the __continuous time__ domain, therefore without any modification it is useless in the __discrete time__ domain used by every digital machine. You won't be able to create a continuous variable that spans through the duration of the signal from the beginning to the end while taking up every possible value.

Machines work with _discrete time series_ that has a property called __resolution__. Resolution is the link between _continous_ and _discrete_ time domain. This property is implemented with __sampling__. It tells us how many data points were sampled equidistantly from the continuous signal within a time segment. In this way we can represent a continuous signal with discrete data point[^1].

Therefore the _t_ variable in the equation can be represented as a vector of data points. To create such a time vector, you have to choose a sampling interval. 

Let's say you want to get __10 samples per seconds__ _(fs=10Hz)_, and you want to have __20 samples__ in your vector. That also means that your time vector will cover almost __2 seconds__[^2] of continuous time. As you can see, as a constraint, the given duration in continuous time is equivalent with the given number of samples if the sampling frequency is known.

{% gist tiborsimon/619da807c9fe3892eaac %}

You can test that the `t1` and `t2` vector are exactly the same. Both vector starts from zero and ends at 1.9. Having the time vector we can generate a sinusoid signal with a frequency of 1Hz. This will result 2 periods in the signal:

{% gist tiborsimon/ec5c237f47cdee3c7794 %}

If we plot the generated signal, we can see, that it is not a sine signal at all. It is a discrete signal, that has values in discrete points as we expected. 

<img src="/images/smart-sinusoids/signal001.png" />

This method is one of the 4 main signal generation methods where we link the discrete time signal to the continuous time. Having such a connection between the two domain, the signal can be played back with the computer's _digital to analog converter_.

However. There are other use cases when we don't want to link the __discrete time__ to the __continuous time__, so we don't have to bother with the sampling frequency, and we can generate a time vector from 0 to 1, and pass it to the equation:

{% gist tiborsimon/f7f3d7a521c01022b41d %}

The result will be a 100 sample long sinusoid signal, that contains 3 periods. But be careful. This signal can't be used as the previous one until we specify the sampling frequency.

<img src="/images/smart-sinusoids/signal002.png" />

As you can see, generating sinusoids with these basic methods isn't hard at all. But you __have to think__ about the method, the formulas and the units. This could be a bit time consuming if you have to think about it every time you want to generate a signal..

## Signal generation use cases

In the previous section we discussed the two most basic ways for generating a sinusoid signal. In this section we will go through all the possible signal generation use cases.

| Variable name      | Possible parameters   |
|:------------------:|:----------------------|
| phi                | phase                 |
| A                  | amplitude             |
| f                  | frequency             |
| fs                 | sample rate           |
| T                  | period                |
| dt                 | sample time           |
| L                  | signal duration       |
| N                  | number of periods     |
| n                  | number of samples     |

| Method index | Required parameters | Description  |
|:-------------:|:--------------------|:-------------|
| 1             | n, N                | a signal consisting of _n_ data points with _N_ periods in it
| 2             | f, N, fs            | a signal sampled at _fs_ sampling rate with _N_ periods in it with the frequency _f_
| 3             | f, n, fs            | a signal consisting of _n_ data points sampled at _fs_ sampling rate with the frequency _f_
| 4             | L, n, fs            | a signal consisting of _n_ data points sampled at _fs_ sampling rate having the length of L seconds
| 5             | f, L, fs            | a signal sampled at _fs_ sampling rate with the duration of _L_ seconds with the frequency _f_

We have already discussed __method 1__ and __method 2__ in the previous section.














[^1]: Of course this is a very high level overview of the [sampling theorem](http://en.wikipedia.org/wiki/Nyquist–Shannon_sampling_theorem). There are much more detail how these things really work.

[^2]: Because we have started our time vector from 0 as the first vector point, the remained 19 points wont cover all the 2 seconds time duration but will span until 1.9 seconds _(2s - 1/fs = 1.9s)_.
