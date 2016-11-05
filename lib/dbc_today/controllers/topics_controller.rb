require_relative '../views/topics_view'
require_relative '../models/topic'

class TopicsController
  attr_reader :view

  def initialize
    @view = TopicsView.new
  end

  def show_topics(phase, week, day)
    topics = Topic.where(phase: phase, week: week, day: day)
    puts view.render_topics(topics)
  end
end