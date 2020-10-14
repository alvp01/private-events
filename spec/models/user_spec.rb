require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.new({:username => 'derpus'})
      expect(u.username).to eql('derpus')
    end
  end

  context 'Testing validations' do
    it 'validates the object to have username attribute' do
      u = User.new({:username => 'El_derpo'})
      expect(u.valid?).to be_truthy
    end

    it 'validates the object without username to be invalid' do
      u = User.new
      expect(u.valid?).to be_falsy
    end

    it 'validates uniqueness' do
      x = User.new({:username => 'El_derpo'})
      x.save
      u = User.new({:username => 'El_derpo'})
      expect(u.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many created events' do
      u = User.new
      expect(u.created_events).to be_a(Object)
    end

    it 'has many attendances' do
      u = User.new
      expect(u.attendances).to be_a(Object)
    end

    it 'has many attended events' do
      u = User.new
      expect(u.attended_events).to be_a(Object)
    end

    it 'saves objects in db' do
      u = User.new({:username => 'El_herpo'})
      u.save
      expect(User.find_by(username: 'El_herpo')).to eql(u)
    end
  end
end
