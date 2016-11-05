require 'colorize'

class TopicsView
  def render_topics(topics)
    "\nTOPIC(S): ".bold +
      topics.map(&:description).join(', ') +
      "\n"
  end
end