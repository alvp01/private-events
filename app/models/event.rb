require 'date'
class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances

  def self.past
    Event.where("event_date < ?", Date.current).all
  end

  def self.upcoming
    Event.where("event_date >= ?", Date.current).all
  end
end
