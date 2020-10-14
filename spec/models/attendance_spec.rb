require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      a = Attendance.new
      expect(a).to be_a(Object)
    end
  end
end
