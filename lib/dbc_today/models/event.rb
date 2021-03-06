require_relative 'timeable'
require 'csv'

class Event
  include Timeable
  attr_reader :phase, :week, :day, :description, :start_time, :end_time

  def initialize(attributes)
    @phase = attributes.fetch(:phase)
    @week = attributes.fetch(:week)
    @day = attributes.fetch(:day)
    @description = attributes.fetch(:description)
    @start_time = attributes.fetch(:start_time)
    @end_time = attributes.fetch(:end_time)
  end

  def all_day?
    start_time.downcase == 'all day' ||
      (starts_at_day_start? &&
      ends_at_day_end?)
  end

  def moment?
    start_time == end_time ||
      end_time.nil?
  end

  def start_time_military
    in_military(start_time)
  end

  def self.all
    list = []
    
    CSV.foreach(
      "#{current_directory}/../data/schedule.csv",
      headers: true,
      header_converters: :symbol,
      skip_blanks: true
    ) do |row|
      list << Event.new(row)
    end

    list
  end

  def self.where(args)
    all.select { |event|
      nil_or_match(event.phase, args[:phase]) &&
        nil_or_match(event.week, args[:week]) &&
        nil_or_match(event.day, args[:day])
    }.sort_by { |e| e.start_time_military }
  end

  private

  def starts_at_day_start?
    return false if start_time.nil?

    start_time.start_with?('9:00a', '9a')
  end

  def ends_at_day_end?
    return false if end_time.nil?

    end_time.start_with?('6:00p', '6p')
  end

  def self.nil_or_match(attribute_value, value_to_match)
    attribute_value.nil? ||
      attribute_value.include?(value_to_match)
  end

  def self.current_directory
    File.expand_path File.dirname(__FILE__)    
  end
end