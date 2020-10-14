require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      a = Attendance.new
      expect(a).to be_a(Object)
    end
  end

  context 'Validating attributes' do
    it 'validates attendance has a user and an event exist' do
      a = Attendance.new({ attended_event_id: 1, attendee_id: 1 })
      expect(a.valid?).to be_falsy
    end

    it 'is valid if the user and event exist' do
      u = User.new({ username: 'El_derpo' })
      u.save
      e = Event.new({ description: 'party hard', location: 'ma house', event_date: '2020-10-10', creator_id: 1 })
      e.save
      a = Attendance.new({ attended_event_id: 1, attendee_id: 1 })
      expect(a.valid?).to be_truthy
    end
  end

  context 'Association testing' do
    it 'belongs to one user and one event' do
      u = User.new({ username: 'El_derpo' })
      u.save
      e = Event.new({ description: 'party hard', location: 'ma house', event_date: '2020-10-10', creator_id: 1 })
      e.save
      a = Attendance.new({ attended_event_id: 1, attendee_id: 1 })
      expect(a.attendee).to eql(u)
      expect(a.attended_event).to eql(e)
    end
  end
end
