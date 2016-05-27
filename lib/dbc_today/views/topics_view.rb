require 'colorize'

class TopicsView
  def display(topics)
    puts "\nTOPICS".bold

    topics.each do |topic|
      puts topic.description
    end

    puts
  end
end