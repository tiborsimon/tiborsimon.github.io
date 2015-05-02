---
layout: post
title: Simple Input Parser
categories: ['category']
tags: ['tag']
published: True

---

# Simple Input Parser

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tiborsimon/simple-input-parser-for-matlab?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Easy to use variable lenght input parser mechanism that provides a convenient way to enchance your custom function parameter handling.

### Features

- Arbitrary parameter order
- Three mode of operation
   - Key value pair mode
   - Bulk mode
   - Flag mode
- Compact yet clear parameter passing

#### Old way to call a function

Say you have a function with a lot of parameters. Some of them may be optional. In the old way, your users had to remember exactly how many parameters would your function need and they had to remember the exact order of the parameters as well.

Let's take a sine syntesizer function.
```
ssin(440, 2, 45, 48e3, 0.8)
```
Is this a user friendly function? I don't think so. This is a __horrible__ function.. Sadly lot of the functions work this way. The user has to look up the definition of the function or the provided help to understand what is happening there.

#### Simple Input Parser way

What if you could provide an on-line help for your users during reading and using your functions?

```
ssin('f', 440, 'A', 2, 'phi', 45, 'fs', 48e3, 'L', 0.8)
```
Much better and readable way to call a function. Evryone knows exactly what is happening here. 

But do you really need to force your users to remember your parameter order that is probably inconvienient for them? 

#### Arbitrary order?

How about they can pass the parameters in an arbitrary order as they want?

```
ssin('A', 2, 'f', 440, 'L', 0.8, 'fs', 48e3, 'phi', 45)
```

Okay, this function is really user friendly now. 

#### A shorter way?

Do your users like to type a lot of commas and apostrophes? I don't think so. How about this function call?

```
ssin('A f L fs phi', 2, 440, 0.8, 48e3, 45)
```

With __Simple Input Parser__ this is a valid input for a function! 

#### An even shorter way?

Well, this is much less character to type here, but I see spaces. Do you want to force your users to type spaces if they don't necessary want to? What if they can left the spaces?

```
ssin('AfLfsphi', 2, 440, 0.8, 48e3, 45)
```

Yes, this is the most compact form of a function call with __Simple Input Parser__. Do you think it is useful you?


Don't hesitate to try it out.

# How to use it?

__Simple Input Parser__ does all of the internal parsing based on a predefined parameter array you pass in during the parsing function call.

Let's say you are going to create a function that takes 3 parameters: a, b and c. Beside the functionality you need to
- pass the parameters in as a single varargin parameter
- create a parameter array and set the default values
- pass these two into the `simple_input_parser()` funtion
- you are done

``` matlab
function ret = my_function( varargin )

    params.a = 42;
    params.b = 'answer';
    params.c = 55.3;

    params = simple_input_parser(params, varargin);

    % further functionalities

end
```
By declaring a default data array you have done two things at once: 
- defining the names of the parameters
- defining it's type

This is enough information for __SImple Input Parser__ to parse the given input, and during the parsing, executing a simple type checking.

The `simple_input_parser()` function returns the parameter array with the updated values in it.

---

Inside the parsing function three things is  happening:

- mode selection
- parsing
- error checking

During the _error checking_, __Simple Input Parser__ will check the data 

# Offered modes of operations

__Simple Input Parser__ can work in three mode. The decision of which mode will be used is decided under the hood based on the provided parameters. You only need to call only one function that will handle the input parsing for you.

## Key value pair mode

This mode is the longest but the most clearer mode of __Simple Input Parser__. You pass in a key, and then the appropriate value. It's that simple.
