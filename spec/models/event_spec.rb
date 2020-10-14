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
    it 'validates the object to have description attribute' do
      u = User.new({:username => 'El_derpo'})
      u.save
      e = Event.new({:description => 'party hard', :location => 'ma house', :event_date => '2020-10-10', :creator_id => 1})
      expect(e.valid?).to be_truthy
    end

    it 'validates the object without description to be invalid' do
      e = Event.new
      expect(e.valid?).to be_falsy
    end
  end

  # context 'Testing associations' do
  #   it 'has many created events' do
  #     u = User.new
  #     expect(u.created_events).to be_a(Object)
  #   end

  #   it 'has many attendances' do
  #     u = User.new
  #     expect(u.attendances).to be_a(Object)
  #   end

  #   it 'has many attended events' do
  #     u = User.new
  #     expect(u.attended_events).to be_a(Object)
  #   end

  #   it 'saves objects in db' do
  #     u = User.new({:username => 'El_herpo'})
  #     u.save
  #     expect(User.find_by(username: 'El_herpo')).to eql(u)
  #   end
  # end
end
