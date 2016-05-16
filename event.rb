require_relative 'timeable'
require 'csv'

class Event
  include Timeable
  attr_reader :phase, :week, :day, :description, :start_time, :end_time

  def initialize(attributes)
    @phase = attributes.fetch(:phase, nil)
    @week = attributes.fetch(:week, nil)
    @day = attributes.fetch(:day, nil)
    @description = attributes.fetch(:description, nil)
    @start_time = attributes.fetch(:start_time, nil)
    @end_time = attributes.fetch(:end_time, nil)
  end

  def start_time_military
    in_military(start_time)
  end

  def self.all
    list = []
    
    CSV.foreach(
      'schedule.csv',
      headers: true,
      header_converters: :symbol,
      skip_blanks: true
    ) do |row|
      list << Event.new(row)
    end

    list
  end

  def self.where(phase:, week:, day:)
    all.select { |event|
      nil_or_match(event.phase, phase) &&
      nil_or_match(event.week, week) &&
      nil_or_match(event.day, day)
    }.sort_by { |e| e.start_time_military }
  end

  private

  def self.nil_or_match(attribute_value, value_to_match)
    attribute_value.nil? ||
      attribute_value.include?(value_to_match)
  end
end