require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  describe 'user page' do
    it 'renders the user show page' do
      assign(:user, User.new({ username: 'El_herpo' }))
      render
      expect(rendered).to match(/events/)
    end
  end
end
