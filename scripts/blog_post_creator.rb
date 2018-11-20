#!/usr/bin/env ruby

require 'date'
require 'erb'

# Ask the user for the blog post title and tags
print "Blog post title: "
blog_post_title = gets.chomp
print "Tags? (Space separated list; leave blank if none) "
tags = Array.new
tags = (gets.chomp).split

# Get today's date and format it so it's suitable for a file
timestamp = DateTime.now.strftime("%Y-%m-%d")

# Turn the blog post title into a suitable filename
blog_post_filename = blog_post_title.gsub(" ", "-").downcase

# Read in the ERB template file
template = File.read('blog_post_template.md.erb')

# Execute the ERB code and produce the templated output
output = ERB.new(template).result(binding)

# Write the templated output into a file
File.open("../drafts/#{timestamp}-#{blog_post_filename}.md", 'w').write(output)