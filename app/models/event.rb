require 'date'
class Event < ApplicationRecord
  scope :past, -> { where('event_date < ?', Date.current) }
  scope :upcoming, -> { where('event_date >= ?', Date.current) }

  validates :description, :location, :event_date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
end
