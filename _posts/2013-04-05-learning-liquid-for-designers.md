---
layout: post
title: "learning liquid for designers"
description: "learning liquid for designers"
category: lessons
tags: []
---
{% include JB/setup %}

You can see it a speical language embed in the html code.

So, as a *Programming* language, it should have such basic concepts:
`data type`, `flow control`, `comment` and `standard methods`, etc.

And as a embed language in html, it should have `markup` sign.

so let's look into it in such concepts.

## Data Type

As a Designer, you do not need to know the backend of the language or
the works in the server side, but know some of these is bonus.

In the server side, programers write code like this:

    @template = Liquid::Template.parse("hi {{name}}")
    @template.render( 'name' => 'tobi' )

"hi {{name}}" is the html code. Yes? This is just a string! you said.
This is ture, you write thousands of lines of code in the editor,
paste it in the form, and sumbmit it... This is what you do as a designer.

As you submit it, the browser post it to the server. The server get the
content you post, and assign it to a variable, maybe just named `page_design`.
The code in the server side now looks like this:

    @template = Liquid::Template.parse(page_design)
    output = @template.render( @products.to_json )
    \# => send to browser.

Json format data is just a bunch of key/value pairs.

If the json data produced by `@products.to_json` is `{'name' => 'Jack'}`.
if you write `{{name}}` , you will get `Jack`. This is the logic.

So, Let's take a look at json's data types:

1. Primitive Types

    * **String**
      
      e.g: "yes?", 'yes?'

    * **Number**

      e.g: 1, 11, 111, 11111111111, 1.0, -1.3, and so on.

    * **Boolean**

      only `true` or `false`

    * **Null**

      it's itself, if you tried to access a variable that not exits, it return Null.

2. Structure Type

    * **Object**

      e.g: {'name' => 'Jack', 'age' => 23, 'box' => [1, 2], 'yes' => true, 'no' => false}

    * **Array**

      e.g: [1, '1', {'name => 'jack', 'age' => 23}, true, false]

There are only Six data types. Very simple? isn't it?

If you are interisted in JSON, vist this site: <http://www.json.org/>

The sever provid the data, render the data provided by you, this means do some logic control from code surrounded by \{\% \%\}, and replace something surrounded by \{\{\}\}.

Of cource, it's so simple, the compiler also do some computation.

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

## Standard Methods

In the offical document, it not named 'standard methods', it named 'standard filters'

In programing languages you call a method like this `object.method_name(arg1, arg2)` or `method_name(object, arg1, arg2)`. But in Liquid, it's different.

In other languages it may be:

    data.method_name(arg1, arg2)

This kind of syntax is called dot notation, but you sill never see it in Liquid.

In Liquid:

    data | method_name: arg1, arg2

The piple line(|) means call a method, the colon(:) means the following is argument.
Yeah! Yeah! it's a object oriented language, isn't it?

In the Official Document, It lists 28 standard filters. There is also no more desciption for them, Just separate it by the data type it respond to.

1. String
  * upcase
  * downcase
  * capitalize
  * escape
  * escape\_once
  * strip\_html
  * strip\_newline
  * newline\_to\_br
  * replace
  * replace\_once
  * remove
  * remove\_once
  * append
  * prepend
  * split \# this is special, it produce an array as the other methods produce a string.
2. Number
  * plus
  * minus
  * times
  * divided_by
  * modulo
3. Array
  * sort
  * map
  * join
  * first
  * last
4. Date
  * data \# yes? so simple? No! There is a long list for it's arguments.