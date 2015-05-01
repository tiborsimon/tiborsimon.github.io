---
layout: post
title: My Python setup
categories: ['programming']
tags: ['python']
published: False
---

Let's sum up how I set up my workstations for Python development.

As you might have been read about it, I have a custom portable toolset, I can use on any Windows machine I want. As the installer of the tools written in Python, the first thing I do on a fresh insdtall, is to install a fresh Python environment on it.

Download the latest Python 3.x release, install it, and test it with the command line.

I use the standard cmd for this purpose, because cmder isn't installed properly yet, and if something went wrong during installation the test will fail in the cmd console.

If python is installed correctly, the next step is to upgrade pip.
Since I had no luck upgrading pip with pip in the past, I run the more generic command to upgrade pip:


{% highlight python linenos=table %}
from itertools import count
 
def generate_primes(stop_at=0):
    primes = []
    for n in count(2):
        if 0 < stop_at < n:
            return # raises the StopIteration exception
        composite = False
        for p in primes:
            if not n % p:
                composite = True
                break
            elif p ** 2 > n:
                break
        if not composite:
            primes.append(n)
            yield n

alist = ['a', 'b', 'c']

print("I just printed {0} pages to the printer {1}".format(num, printer))

print("""Dear %(recipient)s,
 
I wish you to leave Sunnydale and never return.
 
Not Quite Love,
%(sender)s
""" % {'sender': 'Buffy the Vampire Slayer', 'recipient': 'Spike'})

title = "One Good Turn: " \
        'A Natural History of the Screwdriver and the Screw'

a_list = [1, 2, 3, "a dog"]
a_second_list = list()
a_second_list.append(4)
a_second_list.append(5)

def qsort(L):
    if L == []:
        return []
    pivot = L[0]
    return (qsort([x for x in L[1:] if x < pivot]) +
            [pivot] +
            qsort([x for x in L[1:] if x >= pivot]))

class MyClass(object):
   def get_a(self):
      return self._a
   def set_a(self, value):
      self._a = value - 1
   a = property(get_a, set_a, doc="Off by one a")
 
# Python 2.6 style
class MyClass(object):
   @property
   def a(self):
      return self._a
   @a.setter # makes the property writable
   def a(self, value):
      self._a = value - 1

try:
    ham = spam.eggs
except AttributeError:
    handle_error()

@viking_chorus
def menu_item():
    print("spam")
{% endhighlight %}

and this is a line >D




