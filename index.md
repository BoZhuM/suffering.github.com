---
layout: page
tagline: Ruby, Rails, Javascript, Html and CSS.
---
{% include JB/setup %}
<div class='posts'>
  {% for post in site.posts %}
  <div class='well'>
    <h2>
      <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    </h2>
    <span class='text-right'>
    {{ post.date | date_to_string }}&raquo; 
    </span>
    <hr />
    {{ post.content }}
    <p class='text-right'><a href="{{ BASE_PATH }}{{ post.url }}">&raquo; Read More</a></p>
  </div>
  {% endfor %}
</div>
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