require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  describe 'sign up page' do
    it 'shows the right content' do
      visit new_user_path
      expect(page).to have_content('New User')
    end
  end
end
