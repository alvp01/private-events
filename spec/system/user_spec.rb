require 'rails_helper'

RSpec.describe 'User page', type: :system do
  describe 'user home page' do
    it 'shows error message if user is not signed in' do
      visit user_path(1)
      expect(page).to have_content('You must be logged in to access this section')
    end
  end
end
