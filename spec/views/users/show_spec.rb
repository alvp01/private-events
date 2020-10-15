require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  describe 'user page' do
    it 'renders the user show page' do
      user = User.new({ username: 'El_herpo' })
      assign(:user, user)
      assign(:upcoming_events, user.attended_events.upcoming)
      assign(:past_events, user.attended_events.past)
      render
      expect(rendered).to match(/events/)
    end
  end
end
