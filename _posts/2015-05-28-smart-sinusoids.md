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

<img src="/images/smart-sinusoids/3d.png" />

{% include repo_and_release.html %}

# Generating sinusoid signals

Generating sinusoid signals is often the first step for executing a more complex computation. It should be a routine, but actually it isn't. Many people struggles with it.

## The problem

The equation of a sinusoid signal is a known fact:

<img src="http://upload.wikimedia.org/math/9/5/0/95070ea56bf2d63142b522d0e1c34d5d.png">

However. This equation is only valid in the __continuous time__ domain, therefore without any modification it is useless in the __discrete time__ domain used by every digital machine. You won't be able to create a continuous variable that spans through the duration of the signal from the beginning to the end while taking up every possible value.

Machines work with _discrete time series_ that has a property called __resolution__. Resolution is the link between _continous_ and _discrete_ time domain. This property is implemented with __sampling__. It tells us how many data points were sampled equidistantly from the continuous signal within a time segment. In this way we can represent a continuous signal with discrete data points[^1].

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

There are 9 parameters that a pure sinusoid signal could have. In order to be able to generate any kind of sinusoid signals, you should be familiar with the parameters.

<img src="/images/smart-sinusoids/detailed.png" />


| Parameter name | Unit | Possible parameters   |
|:--------------:|:----:|:---------------------:|
| `phi`        | [degree]    | phase          |
| `A`          | [full scale] | amplitude[^3] |
| `f`          | [Hz]   | frequency           |
| `fs`         | [Hz]  | sample rate          |
| `T`          | [s]   | period               |
| `dt`         | [s]   | sample time          |
| `L`          | [s]   | signal duration      |
| `N`          | [-]   | number of periods    |
| `n`          | [-]   | number of samples    |

With these parameters there are 5 main generation methods for sinusoid signals. Each of them have alternatives that doesn't count as an individual generation method due to the used parameters can be derived from the others if you apply the following formulas: _fs = 1/dt_, _T = 1/f_ and _L=n*dt_.

| Method index | Required parameters | CT DT lock     | Description  |
|:-------------:|:------------------|:--------------|:-------------|
| 1 | `n`, `N`          | No  | a signal consisting of `n` data points with `N`<br> periods in it
| 2 | `L`, `N`, `fs`    | Yes | `L` seconds long signal sampled at `fs` consisting <br>`N` periods in it
| 3 | `f`, `N`, `fs`    | Yes | a signal sampled at `fs` sampling rate with `N` <br>periods in it with the frequency `f`
| 4 | `f`, `n`, `fs`    | Yes | a signal consisting of `n` <br>data points sampled at `fs` sampling rate with the frequency `f`
| 5 | `f`, `L`, `fs`    | Yes | a signal sampled at `fs` sampling rate with the <br>duration of `L` seconds with the frequency `f`

Let's try out all methods, to see how you can use them in practice. Let's generate the same 60 samples of sinusoid signal with 2.5 periods in it with the amplitude 1 at an arbitrary sampling frequency:

<img src="/images/smart-sinusoids/demo_signal.png" />

The used parameters may seem a bit odd for the first time, but due to the constraint of generating the same signal with all the methods, they will be reasonable.

### Method 1 - [n,N]

Generating a sinusoid signal with `n` data points with `N` periods in it.

{% gist tiborsimon/8e167f64fb80e2a95b13 %}



### Method 2 - [L,N,fs]

Generating `L` seconds long signal consisting `N` periods in it with the frequency `f`.

{% gist tiborsimon/abe9fb85958ee9205ea0 %}



### Method 3 - [f,N,fs]

Generating a sinusoid signal sampled at `fs` sampling rate with `N` periods in it with the frequency `f`.

{% gist tiborsimon/7ba58552ddfc4d605c80 %}



### Method 4 - [f,n,fs]

Generating a signal consisting of `n` data points sampled at `fs` sampling rate with the frequency `f`.

{% gist tiborsimon/d6ea2be7afba202f2923 %}



### Method 5 - [f,L,fs]

Generating a sinusoid signal sampled at `fs` sampling rate with the duration of `L` seconds with the frequency `f`.

{% gist tiborsimon/51dca17af664f51ecc0b %}


That's it. These 5 methods cover all the possible non redundant ways to generate sinusoidal signals. Did you understand them? Did you like them? Will you use them? Will you _study_ them? Will you _derive_ them over and over again? There is a better way for these basic tasks.

If your answers for the last two questions were both _nope_, then the go ahead and meet __Smart Sinusoids__. 




# Smart Sinusoids - the easy way

__Smart Sinusoids__ is a trigonomecric function wrapper that's main purpose is to help you to generate sinusoid signals. It does this with the help of [Simple Input Parser]({% post_url 2015-05-02-simple-input-parser %}) and the _Parameter Engine_ written inside of it. [Simple Input Parser]({% post_url 2015-05-02-simple-input-parser %}) allows you to give __Smart Sinusoids__ parameters in any order you want, and the _Parameter Engine_ allows you to give any type of parameters and it will try to compose with them a sinusoid signal.

To demonstrate how easy is to use __Smart Sinusoids__ let's compare it to the old fashion way.

{% gist tiborsimon/89c9ca291f761c988d7e %}

These two script produce exactly the same signal while __Smart Sinusoids__ requires only one line versus a couple of lines with the old method. The biggest advantage is that you don't need to know how to generate the sinusoid with the given requirement set. 

As we have reviewed, there are 5 different method to generate a sinusoid signal depending on the requirements. With __Smart Sinusoids__ the previous five use cases looks like this:

{% gist tiborsimon/a7551c20ca9203eaa6f1 %}

Sounds better and easier? Let's see what can you do with __Smart Sinusoids__.

# Input parameter configurations

__Smart Sinusoids__ uses [Simple Input Parser]({% post_url 2015-05-02-simple-input-parser %}) as an input parser framework, so it can accept various input configurations.

The main advantage here is the arbitrary parameter order. You give the parameters in any order you want. There are two possible style __Smart Sinusoids__ will accepts:

- Arbitrary key-value pairs mode
- Arbitrary bulk parameter mode

## Key-value pairs mode

In this mode you write a parameter name in string, then you pass the value with an existing variable or a pure value. The available keys are the following:

`phi` `A` `f` `fs` `T` `dt` `L` `N` `n` 

You can pass redundant informations, __Smart Sinusoids__ will warn you if the is ambiguouty in your parameters. Here is an example using this mode:

{% gist tiborsimon/8b90eec73bf33cc16385 %}

This small snippet will generate a 2 seconds long 440 Hz tone at the sampling rate of 48 kHz.

Again, the parameter order is arbitrary, and you can pass any combination of parameters, __Smart Sinusoids__ will try to generate a sinusoid signal with the given parameters.

## Bulk parameter mode

This mode allows you to list all the parameter keys you want to use at once as the first parameter, then you list all the values one to another. This mode is much more faster to type than the key-value pairs mode. You can use the same parameter set as before. Let's see an example:

{% gist tiborsimon/6920894232f8a25985b4 %}

This snippet will generate exactly the same signal as the key-value pairs example, however you had to type much less.

Another benefit of using [Simple Input Parser]({% post_url 2015-05-02-simple-input-parser %}) is the no need for spaces. Do you like to type spaces if you doesn't forced to? I don't think so. The following snippet is still a perfectly valid input for __Smart Sinusoids__:

{% gist tiborsimon/ddb0379f90b1bbfeca77 %}

This is the most compact way to tell __Smart Sinusoids__ what you want to generate.

# Output parameter configurations

__Smart Sinusoids__ provides three output configurations:

- No output arguments
- One output argument
- Two output arguments

## No output argument

With this configuration Smart Sinusoid generates a vector containing the desired signal in place. In this way you can use it inside other functions parameterlist e.g. plot and the others.

{% gist tiborsimon/19dac7dc5ab5248675e1 %}

## One output argument

In one output argument configuration __Smart Sinusoids__ loads the output vector in  variable you provided. You can then do whatever you want with this variable.

{% gist tiborsimon/39ddcd1a2e4248f7746e %}

## Two output arguments

__Smart Sinusoids__ is capable of generating a time vector for the generated signal vector if you use two output parameters. It can generate three types of time vector, by adding an extra parameter `x` to your parameter list.

| Time vector type | `x` parameter  | Description |
|:-----------------|:-------------------|:------------|
| __Sample count__ _(default)_ | `index` | Sample indexes from 1 to the number of samples.
| Normalized       | `norm`              | Normalized vector spans from 0 to 1.
| Time [s]         | `time` or `s`       | Time duration of the signal in seconds.
| Time [ms]        | `militime` or `ms`  | Time duration of the signal in seconds.

Since MATLAB's plotting functions expects the x vector first, __Smart Sinusoids__ provides the time vector in the first one of the two output parameterst.

{% gist tiborsimon/2eb122ef8ccdadf6f1a5 %}

# The Parameter Engine

The parameter engine tries to generate the needed parameters used by the five methods discussed before from the provided parameters. It uses the following table of equations that consists all of the possible connections between the individual parameters.

| f   | T   | n   | N   | fs  | dt  | L   |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1/T | 1/f | L fs | L/T | 1/dt | 1/fs | N T |
| N/L | L/N | L/dt | L f | n/L | L/n | n dt |
| n dt/L/T | L/n/dt/f | N T/dt | n dt/T | n/N/T | N T/n | N/f |
| n/fs/T/L | L fs/n/f | N T fs | n dt f | n/L/f/T | L f T/n | n/fs |
| - | - | - | n/fs/T | - | - | - |
| - | - | - | n f/fs | - | - | - |

The signal generator mechanism first tries to use method number one and it asks for the required parameters from the _Parameter Engine_ which tries to construct the parameter from the other given parameters if the needed parameter isn't provided explicitly. If the construction fails too, the engine throws an exception signaling that the method could not be used, and the signal generator falls back to the next generation mechanism, and asks for the necessary parameters from the _Parameter Engine_...

If the last generator method failed, the generator mechanism warns the user that the provided parameters were insufficient.

# Summary

Do you like these features? If you do, don't hesitate to try it out. 

{% include repo_and_release.html %}





[^1]: Of course this is a very high level overview of the [sampling theorem](http://en.wikipedia.org/wiki/Nyquist–Shannon_sampling_theorem). There are much more detail how these things really work.

[^2]: Because we have started our time vector from 0 as the first vector point, the remained 19 points wont cover all the 2 seconds time duration but will span until 1.9 seconds _(2s - 1/fs = 1.9s)_.

[^3]: PC sound cards usually accept signals scaled -1 to 1.
