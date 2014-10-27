
# I'm starting with a hacky script to
# experiment with how to do this.
#
# This project probably won't end up
# being written in Ruby. Who knows though.
#
# THIS IS SHITTY CODE AND I KNOW IT!
#
# Let the scripting BEGIN!

require 'bundler'
Bundler.setup
require 'sass'

tree = Sass::Engine.new(File.open("input.scss").read, :syntax => :scss).to_tree
visited = Sass::Tree::Visitors::Perform.visit(tree)


def search(node)
  if node.is_a? Sass::Tree::CommentNode
    show_comment(node)
  else
    node.children.each { |n| search(n) }
  end
end

def show_comment(node)
  puts node.resolved_value
end

search(visited)
