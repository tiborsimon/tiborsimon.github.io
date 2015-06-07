---
layout: post
title: Smart Sinusoids
categories: ['programming']
tags: ['matlab']
published: True
repo_link: https://github.com/tiborsimon/smart-sinusoids
dowload_link: 
version: v1.0
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

Let's say you want to get __10 samples per seconds__ _(fs=10Hz)_, and you want to have __20 samples__ in your vector. That also means that your time vector will cover almost __2 seconds__[^2] of continuous time.

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

## Sinusoid signal parameters

We have seen the actual equation for the sinusoid signals. In this section we will examine all of the possible parameters that can be used to describe such a signal. Let's start with a figure, that shows all signal parameters at once:

<img src="/images/smart-sinusoids/detailed.png" />

You should be familiar with all of the parameters needed to generate a sinusoid signal if you want to master the it. The following tables will sum up all the parameters and the generation methods you can use.

| Variable name  | Unit | Possible parameters   |
|:--------------:|:----:|:---------------------:|
| __phi__        | [degree]    | phase                 |
| __A__          | [full scale]   | amplitude[^3]             |
| __f__          | [Hz]   | frequency             |
| __fs__         | [Hz]  | sample rate           |
| __T__          | [s]   | period                |
| __dt__         | [s]   | sample time           |
| __L__          | [s]   | signal duration       |
| __N__          | [-]   | number of periods     |
| __n__          | [-]   | number of samples     |

| Method index | Required parameters | CT DT lock     | Description  |
|:-------------:|:------------------:|:--------------:|:-------------|
| 1             | __n__, __N__                   | No             | a signal consisting of __n__ data points with __N__ periods in it
| 2             | __L__, __N__, __fs__           | Yes            | __L__ seconds long signal consisting __N__ periods with the frequency __f__
| 3             | __f__, __N__, __fs__           | Yes            | a signal sampled at __fs__ sampling rate with __N__ periods in it with the frequency __f__
| 4             | __f__, __n__, __fs__           | Yes            | Generating a sinusoid signal consisting of __n__ data points sampled at __fs__ sampling rate with the frequency __f__
| 5             | __f__, __L__, __fs__           | Yes            | a signal sampled at __fs__ sampling rate with the duration of __L__ seconds with the frequency __f__

There is no more options to specify a sinusoid signal. All the other possible specifications are redundant as _fs = 1/dt_, _T = 1/f_ and _L=n*dt_.

We have already discussed _method 1_ and _method 2_ in the previous section, but let's go through all of the methods once more just for sure :) All of the following example will generate exactly the same signal:

<img src="/images/smart-sinusoids/demo_signal.png" />

### Method 1 - [n,N]

Generating a sinusoid signal with __n__ data points with __N__ periods in it.

{% gist tiborsimon/8e167f64fb80e2a95b13 %}



### Method 2 - [L,N,fs]

Generating __L__ seconds long signal consisting __N__ periods in it with the frequency __f__.

{% gist tiborsimon/abe9fb85958ee9205ea0 %}



### Method 3 - [f,N,fs]

Generating a sinusoid signal sampled at __fs__ sampling rate with __N__ periods in it with the frequency __f__.

{% gist tiborsimon/7ba58552ddfc4d605c80 %}



### Method 4 - [f,n,fs]

a signal consisting of __n__ data points sampled at __fs__ sampling rate with the frequency __f__.

{% gist tiborsimon/d6ea2be7afba202f2923 %}



### Method 5 - [f,L,fs]

Generating a sinusoid signal sampled at __fs__ sampling rate with the duration of __L__ seconds with the frequency __f__.

{% gist tiborsimon/51dca17af664f51ecc0b %}


That's it. These 5 methods cover all the possible non redundant ways to generate sinusoidal signals. Did you understand them? Did you like them? Will you use them? Will you _study_ them? Will you _derive_ them over and over again? There is a better way for these basic tasks.

# Smart Sinusoids - the easy way

If your answers for the last two questions were both _nope_, the following method will like you. What method do you prefer the most?

{% gist tiborsimon/89c9ca291f761c988d7e %}

These two script produce exactly the same signal while Smart Sinusoids requires only one line versus a couple of lines with the old method. The biggest advantage is that you don't need to know how to generate the sinusoid with the given requirement set. 

As we have reviewed, there are 5 different method to generate a sinusoid signal depending on the requirements. With Smart Sinusoids the previous five use cases looks like this:



|  | Old method | Smart Sinusoids |
|:--------------:|:----:|:---------------------:|
| __Pros__ | You know the method | You don't need to know the method<br>Flexible parameters<br>Any parameter configuration
| __Cons__ | You have to know the method    | Hides the generation details (you should know them)            |
























[^1]: Of course this is a very high level overview of the [sampling theorem](http://en.wikipedia.org/wiki/Nyquist–Shannon_sampling_theorem). There are much more detail how these things really work.

[^2]: Because we have started our time vector from 0 as the first vector point, the remained 19 points wont cover all the 2 seconds time duration but will span until 1.9 seconds _(2s - 1/fs = 1.9s)_.

[^3]: PC sound cards usually accept signals scaled -1 to 1.
