require "fileutils"

require "rubygems"
require "bundler/setup"
require "minitest/autorun"
require "fastimage"
require "nokogiri"
require "redcarpet"

cat = <<-'cat'



                                                   .--.
                                                   `.  \
                                                     \  \
                                                      .  \
                                                      :   .
                                                      |    .
                                                      |    :
                                                      |    |
      ..._  ___                                       |    |
     `."".`''''""--..___                              |    |
     ,-\  \             ""-...__         _____________/    |
     / ` " '                    `""""""""                  .
     \                                                      L
     (>                                                      \
    /                                                         \
    \_    ___..---.                                            L
      `--'         '.                                           \
                     .                                           \_
                    _/`.                                           `.._
                 .'     -.                                             `.
                /     __.-Y     /''''''-...___,...--------.._            |
               /   _."    |    /                ' .      \   '---..._    |
              /   /      /    /                _,. '    ,/           |   |
              \_,'     _.'   /              /''     _,-'            _|   |
                      '     /               `-----''               /     |
                      `...-'                                       !_____)


cat

puts cat
puts "
  Hello you lovely GitHub blog author person human!
  This is test output from your blog post you just wrote. Unlike most tests in
  life (and code!), it's *totally cool* to fail these tests. They're just here
  to catch anything you might have missed while writing your draft.
  Consider them suggestions rather than things you *need* to do before
  publishing your post.
  Happy shipping!
"

module Blog
  class Test < MiniTest::Test
    # All the posts we're interested in checking. This means we're looking at
    # files that have changed on this particular branch we're on.
    #
    # Returns an Array of String filenames.
    def posts
      diffable_files = `git diff --name-only --diff-filter=ACMRTUXB origin/public | grep .markdown`.split("\n")

      posts = diffable_files.select do |filename|
        File.ctime(filename) > Time.new(2014,9,3)
      end

      posts
    end
  end
end
