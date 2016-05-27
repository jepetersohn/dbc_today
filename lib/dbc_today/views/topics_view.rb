require 'colorize'

class TopicsView
  def display(topics)
    print "\nTOPIC(S): ".bold
    puts topics.map { |topic| topic.description }.join(', ')
  end
end