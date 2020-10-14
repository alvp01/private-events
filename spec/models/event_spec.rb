require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      e = Event.new
      expect(e).to be_a(Object)
    end

    it 'assigns the values passed' do
      e = Event.new({:description => 'party hard'})
      expect(e.description).to eql('party hard')
    end
  end

  context 'Testing validations' do
    it 'validates the event to have attributes' do
      u = User.new({:username => 'El_derpo'})
      u.save
      e = Event.new({:description => 'party hard', :location => 'ma house', :event_date => '2020-10-10', :creator_id => 1})
      expect(e.valid?).to be_truthy
    end

    it 'validates the event without attributes to be invalid' do
      u = User.new({:username => 'El_derpo'})
      u.save
      e = Event.new
      expect(e.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'validates the event to have a creator' do
      u = User.new({:username => 'El_derpo'})
      u.save
      e = Event.new({:description => 'party hard', :location => 'ma house', :event_date => '2020-10-10', :creator_id => 1})
      expect(e.valid?).to be_truthy
    end

    it 'validates the event without creator to be invalid' do
      e = Event.new({:description => 'party hard', :location => 'ma house', :event_date => '2020-10-10', :creator_id => 1})
      expect(e.valid?).to be_falsy
    end

    it 'validates the event to have a creator' do
      u = User.new({:username => 'El_derpo'})
      u.save
      e = Event.new({:description => 'party hard', :location => 'ma house', :event_date => '2020-10-10', :creator_id => 1})
      expect(e.creator.username).to eql(u.username)
    end

    it 'has many attendees' do
      e = Event.new
      expect(e.attendees).to be_a(Object)
    end

    it 'has many attendances' do
      e = Event.new
      expect(e.attendances).to be_a(Object)
    end
  end
end
