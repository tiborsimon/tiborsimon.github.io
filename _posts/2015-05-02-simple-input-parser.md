---
layout: post
title: Simple Input Parser
categories: ['programming']
tags: ['matlab']
published: True

---

Easy to use variable lenght input parser mechanism that provides a convenient way to enchance your custom function parameter handling.

The current version sports a _MATLAB_ implementation, but other language ports are coming too.

### Features

- Arbitrary parameter order
- Three mode of operation
   - Key value pair mode
   - Bulk mode
   - Flag mode
- Compact yet clear parameter passing
- Parameter validation by type
- Custom validator functions

### Old way to call a function

Say you have a function with a lot of parameters. Some of them may be optional. In the old way, your users had to remember exactly how many parameters would your function need and they had to remember the exact order of the parameters as well.

Let's take a sine syntesizer function.
```
ssin(440, 2, 45, 48e3, 0.8)
```
Is this a user friendly function? I don't think so. This is a __horrible__ function.. Sadly lot of the functions work this way. The user has to look up the definition of the function or the provided help to understand what is happening there.

### Simple Input Parser way

What if you could provide an on-line help for your users during reading and using your functions?

```
ssin('f', 440, 'A', 2, 'phi', 45, 'fs', 48e3, 'L', 0.8)
```
Much better and readable way to call a function. Everyone knows what is happening exactly. 

But do you really need to force your users to remember your parameter order that is probably inconvenient for them? 

### Arbitrary order?

How about they can pass the parameters in an arbitrary order as they want?

```
ssin('A', 2, 'f', 440, 'L', 0.8, 'fs', 48e3, 'phi', 45)
```

Okay, this function is really user friendly now. 

### A shorter way?

Do your users like to type a lot of commas and apostrophes? I don't think so. How about this function call?

```
ssin('A f L fs phi', 2, 440, 0.8, 48e3, 45)
```

With __Simple Input Parser__ this is still a valid input for a function! 

### An even shorter way?

Well, there is much less character to type, but I can see repeated spaces between the keys. Do you want to force your users to type spaces if they don't necessary want to? What if they can left the spaces?

```
ssin('AfLfsphi', 2, 440, 0.8, 48e3, 45)
```

Yes, this is the most compact form of a function call with __Simple Input Parser__ that produces values. Do you think this is useful for you?

There is an even shorter form that is called _Flag mode_ which receives only the keys and returns a boolean array based on the keys the user passes in.

Don't hesitate to try it out.

<a href='https://github.com/tiborsimon/simple-input-parser' class="btn"><i class="fa fa-github-alt"></i> Go to GitHub</a>
