class Topic
  attr_reader :phase, :week, :day, :description

  def initialize(attributes)
    @phase = attributes.fetch(:phase)
    @week = attributes.fetch(:week)
    @day = attributes.fetch(:day)
    @description = attributes.fetch(:description)
  end

  def self.all
    list = []
    
    CSV.foreach(
      "#{current_directory}/../data/topics.csv",
      headers: true,
      header_converters: :symbol,
      skip_blanks: true
    ) do |row|
      list << Topic.new(row)
    end

    list
  end

  def self.where(args)
    all.select { |topic|
      topic.phase == args[:phase] &&
      topic.week == args[:week] &&
      topic.day == args[:day]
    }
  end

  def self.current_directory
    File.expand_path File.dirname(__FILE__)    
  end
end