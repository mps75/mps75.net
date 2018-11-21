---
layout: post
title: Post creator script
date: 2018-11-21
author:
  twitter: mps75
tags: [blog, ruby]
---

Jekyll blog posts are simply text files written in [Markdown](https://daringfireball.net/projects/markdown/syntax).  But, they need to be named a certain way and they need to include specific metadata, known as "front matter," at the beginning of the file.  I've been rekindling my love affair with Ruby lately and figured I'd write a silly little script to help me create new posts since I can never remember the file naming convention and how to craft the required front matter.  I think there might already be a gem out there named [Jekyll Compose](https://github.com/jekyll/jekyll-compose) that does something similar.  But, since I'm looking for Ruby projects I figured it would be more fun to write something from scratch.

In the past at work I've used Python and Jinja templates for this kind of thing so I figured the Ruby analog to Jinja -- [ERB](https://ruby-doc.org/stdlib-2.5.3/libdoc/erb/rdoc/ERB.html) -- would work well.  Here's what I came up with.

First the `blog_post_creator.rb` script:

{% highlight ruby %}
#!/usr/bin/env ruby

require 'date'
require 'erb'

# Ask the user for the blog post title and tags
print "Blog post title: "
blog_post_title = gets.chomp
print "Tags? (Space separated list; leave blank if none) "
tags = Array.new
tags = (gets.chomp).split

# Get today's date and format it so it's suitable for a filename
timestamp = DateTime.now.strftime("%Y-%m-%d")

# Turn the blog post title into a suitable filename
blog_post_filename = blog_post_title.gsub(" ", "-").downcase

# Read in the ERB template file
template = File.read('blog_post_template.md.erb')

# Execute the ERB code and produce the templated output
output = ERB.new(template).result(binding)

# Write the templated output into a new post file
File.new("../drafts/#{timestamp}-#{blog_post_filename}.md", 'w').write(output)
{% endhighlight %}


Next the `blog_post_template.md.erb` ERB template:

```yaml
---
layout: post
title: <%= blog_post_title %>
date: <%= timestamp %>
author:
  twitter: mps75
tags: <%= tags %>
---


```


Here's what it looks like to run the script:

{% highlight bash %}
Mac-mini:scripts mswanson$ ruby blog_post_creator.rb
Blog post title: OMG new post
Tags? (Space separated list; leave blank if none) blog test
{% endhighlight %}


Lastly, here's what the blog post file looks like (it's named: 2018-11-21-omg-new-post.md).

```yaml
---
layout: post
title: OMG new post
date: 2018-11-21
author:
  twitter: mps75
tags: ["blog", "test"]
---


```

Now the hard part -- get some content in there....