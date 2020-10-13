class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attendees, through: :attendances
end
