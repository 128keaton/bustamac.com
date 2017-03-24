require_relative "test_helper"
require "gingerice"

class CorrectionTest < Blog::Test
  def test_grammer_good
    posts.each do |post|
      content = File.read(post)
      content = content.gsub(/\A---(.|\n)*?---/, '')

      parser = Gingerice::Parser.new
      output = parser.parse(content)
      if output["corrections"].count == 0
          puts "nope"
      else
          puts "Horrible, just awful!"
          puts output["corrections"]
      end

      assert_equal output["corrections"].count, 0, "This post has grammatical and/or spelling errors: "
    end
  end
end
