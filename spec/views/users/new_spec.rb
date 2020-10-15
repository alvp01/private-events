require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  describe 'sign up template' do
    it 'renders the sign up page' do
      assign(:user, User.new)
      render
      expect(rendered).to match(/text/)
    end
  end
end
