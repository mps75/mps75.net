#!/usr/bin/env ruby

require 'date'
require 'erb'

# Ask the user for the blog post title and tags
print 'Blog post title: '
blog_post_title = gets.chomp
print 'Tags? (Space separated list; leave blank if none): '
tags = gets.chomp.split

# Get today's date and format it so it's suitable for a filename
timestamp = Time.now.strftime('%Y-%m-%d')

# Turn the blog post title into a suitable filename
blog_post_filename = blog_post_title.tr(' ', '-').downcase

# Read in the ERB template file
template = File.read('blog_post_template.md.erb')

# Execute the ERB code and produce the templated output
output = ERB.new(template).result(binding)

# Write the templated output into a new post file
File.new("../drafts/#{timestamp}-#{blog_post_filename}.md", 'w').write(output)
