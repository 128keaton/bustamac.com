require_relative "test_helper"

class TodayTest < Blog::Test
  def test_doesnt_start_with_today
    posts.each do |post|
      content = File.read(post)
      content = content.gsub(/\A---(.|\n)*?---/, '')
      puts content
      body_text = content.split("\n").delete_if do |line|
        line[0] == "#" || line.strip == ""
      end

      refute body_text.first =~ /Today/, "Posts usually shouldn't start with \"Today\""
    end
  end
end
