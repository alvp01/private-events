require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  describe 'sign in page' do
    it 'Loads the right content' do
      visit new_session_path
      expect(page).to have_content('Sign in')
    end
  end
end
