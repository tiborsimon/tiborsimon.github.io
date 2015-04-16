---
layout: post
title: My Python setup
categories: ['python']
tags: ['setup', 'machine', 'windows']
published: True
---

Let's sum up how I set up my workstations for Python development.

As you might have been read about it, I have a custom portable toolset, I can use on any Windows machine I want. As the installer of the tools written in Python, the first thing I do on a fresh insdtall, is to install a fresh Python environment on it.

Download the latest Python 3.x release, install it, and test it with the command line.

I use the standard cmd for this purpose, because cmder isn't installed properly yet, and if something went wrong during installation the test will fail in the cmd console.

If python is installed correctly, the next step is to upgrade pip.
Since I had no luck upgrading pip with pip in the past, I run the more generic command to upgrade pip:

~~~
python -m pip install --upgrade pip
...
pip 6.1.1 from C:\Python34\lib\site-packages (python 3.4)
~~~

{% highlight python title.py%}
__author__ = 'Tibor'

from unittest import TestCase

from ..my_module import some_method

class TestClass(TestCase):
    def test__my_test(self):
        print('I am a testcase..')
        result = some_method()
        self.assertEqual(42, result)

    def test_my_second_test(self):
        self.assertTrue(True)

{% endhighlight %}

