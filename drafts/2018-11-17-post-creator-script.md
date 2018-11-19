---
layout: post
title: Post creator script
date: 2018-11-17
tags: [blog, ruby]
---

Jekyll blog posts are simply text files written in markdown.  But, they need to be named a certain way and they need to include some metadata, known as "front matter" at the beginning of the file.  I've been rekindling my love affair with Ruby lately and figured I'd write a silly little script that will help me create new posts by adhering to the required file naming convention and crafting the required front matter.

In the past I've used Python and Jinja templates for this kind of thing at work so I figured Ruby and ERB would be similar.  Here's what I came up with.

First the `blog_post_creator.rb` script:

{% highlight ruby %}
HERE
{% endhighlight %}


Next the `blog_post_template.md.erb` ERB template:

```yaml
HERE
```