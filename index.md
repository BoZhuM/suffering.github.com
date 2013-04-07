---
layout: page
tagline: Ruby, Rails, Javascript, Html and CSS.
---
{% include JB/setup %}

<ul class="posts">
{% for post in site.posts %}
<li>
  <span>
    {{ post.date | date_to_string }}
  </span>&raquo; 
  <a href="{{ BASE_PATH }}{{ post.url }}">
    {{ post.title }}
  </a>
</li>
{% endfor %}
</ul>
<div class='posts'>
  {% for post in site.posts %}
  <div class='well'>
    <h2>
      <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    </h2>
    <hr />
    {{ post.raw_content | truncate:1000 | markdownify}}
    <p class='text-right'><a href="{{ BASE_PATH }}{{ post.url }}">&raquo; Read More</a></p>
  </div>
  {% endfor %}
</div>