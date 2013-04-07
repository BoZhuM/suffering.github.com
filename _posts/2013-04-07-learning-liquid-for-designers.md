---
layout: post
title: "Learning Liquid for Desingers"
description: "Learning Liquid for Desingers"
category: lessons
tags: [Liquid, Design]
---

{% include JB/setup %}

You can see Liquid a speical language which can be embedded in the html code.
As a *Programming* language, it should have some basic concepts:
`data type`, `flow control(Logic)`, `operators` and `standard methods`, etc.

And as a embedded language in html, it should have `markup` sign.

so let's look into such concepts.

## Data Type

As a Designer, you do not need to know the backend of the language or
the works in the server side, but know some of these is bonus.

In the server side, programers write code like this:

{% highlight ruby %}
    @template = Liquid::Template.parse("hi {{name}}")
    @template.render( 'name' => 'tobi' )
{% endhighlight %}

"hi {{name}}" is the html code. Yes? This is just a string! you said.
This is ture, you write thousands of lines of code in the editor,
paste it in the form, and sumbmit it... This is what you do as a designer.

As you submit it, the browser post it to the server. The server get the
content you post, and assign it to a variable, maybe just named `page_design`.
The code in the server side now looks like this:

    @template = Liquid::Template.parse(page_design)
    output = @template.render( @products.to_json )
    # => send to browser.

JSON format data is just a bunch of key/value pairs.

If the JSON data produced by `@products.to_json` is `{'name' => 'Jack'}`.
if you write `name` in the Output markup , you will get `Jack`. This is the logic.

So, Let's take a look at JSON's data types:

1. Primitive Types

    * **String**
      
      e.g: `"yes?"`, `'yes?'`

    * **Number**

      e.g: `1`, `11`, `111`, `11111111111`, `1.0`, `-1.3`, and so on.

    * **Boolean**

      `true` or `false`

    * **Null**

      it's itself, if you tried to access a variable that not exits, it return Null.

2. Structure Type

    * **Object**

      e.g: `{'name' => 'Jack', 'age' => 23, 'box' => [1, 2], 'yes' => true, 'no' => false}`

    * **Array**

      e.g: `[1, '1', {'name => 'jack', 'age' => 23}, true, false]`

There are only Six data types. Very simple? isn't it?

If you are interested in JSON, vist this site: <http://www.JSON.org/>

## Flow Control

Now, You get the data, then you need to use some tags to realize the logic in your design.

There are 7 kids of tags are provided:

1. if/elsif/else/endif
1. unless/elsif/else/endunless
1. case/when/endcase
1. for/endfor
1. cycle
1. include
1. raw/endraw

`if`,`unless` and `case` focus on conditions judgement. `for` and `cycle` focus on loop. You can see these tags as the keywords in other programming languages. This means what? 
Means that you can't assign a variable named exactly equivalent to it. They are reserved!

There is no description on them, just check the [official document](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers). There are detailed descriptions and examples.


## Opertors : Using in Output tags.

e.g:

    {% raw %}
        {% assign string = 'hello, world!' %}
        {% if string contains 'hello' %}
           yeah!  it contains 'hello'
        {% else %}
           no! "{{string}}" do not contain 'hello'.
        {% endif %}
    {% endraw %}

The output is:

    {% assign string = 'hello, world!' %}
    {% if string contains 'hello' %}
       yeah!  it contains 'hello'
    {% else %}
       no! "{{string}}" do not contain 'hello'.
    {% endif %}

### Standard Operators(9)

    ==          Equal
    !=          Not equal
    >           Bigger than
    <           Smaller than
    >=          Bigger than or equal
    <=          Less than or equal
    or          either this or that
    and         must be this and that
    contains    includes the substring if used on a string, or element if used on an array.

## Standard Filters : Using in Logic tags.

In the offical document, it not named 'standard methods', it named 'standard filters'

To call a method, in other languages it may be:

    data.method_name(arg1, arg2)

This kind of syntax is called dot notation, but you won't see it in Liquid.

    data | method_name: arg1, arg2

e.g: 

{% raw %}

    {{ 'Jack' | replace: 'k', 'e'  }}

{% endraw %}

The output is:

    {{ 'Jack' | replace: 'k', 'e'  }}

The piple line(|) means call a method, the colon(:) means the following is argument.
Yeah! Yeah! it's a object oriented language, isn't it?

### Standard Filters

In the Official Document, It lists 27 standard filters. There is also no more desciption for them, Just separate it by the data type it respond to.

1. **String**(16)
  1. upcase
  1. downcase
  1. capitalize
  1. escape
  1. escape\_once
  1. strip\_html
  1. strip\_newline
  1. newline\_to\_br
  1. replace
  1. replace\_first
  1. remove
  1. remove\_first
  1. append
  1. prepend
  1. truncate
  1. truncatewords
  1. split \# This is special, it produce an array as the other methods produce a string.
  1. size \# array also responds to this filter.

2. **Number**(5)
  1. plus
  1. minus
  1. times
  1. divided_by
  1. modulo

3. **Array**(6)
  1. sort
  1. map
  1. join
  1. first
  1. last
  1. size \# string also responds to this filter.

4. **Date**(1)
  1. data \# yes? so simple? No! There is a long list for it's arguments.

If you read through the [Shopify Document](http://wiki.shopify.com/Filters),
You will find that there are many filters listed in it. Notice that most of them
is not supported by liquid-2.5.0 .

[The cheatsheet](http://cheat.markdunkley.com/) looks nice, but it also not full supported by the standard gem.