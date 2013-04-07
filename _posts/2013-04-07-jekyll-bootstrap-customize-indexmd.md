---
layout: post
title: "Jekyll bootstrap, customize index"
description: "To customize your index.md with little trick."
category: lessons
tags: [Jekyll Bootstrap]
---
{% include JB/setup %}

Using Jekyll Bootstrap, You want to customize your Home Page. In the defaut `index.md` page, There is a sample posts list.

Let's take a look at the source code of the posts list:

{% raw %}

    <ul class="posts">
        {% for post in site.posts %}
          <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
      {% endfor %}
    </ul>

{% endraw %}

In the Home page of your blog, you want to list your posts in.