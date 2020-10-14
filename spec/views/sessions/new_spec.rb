require 'rails_helper'

RSpec.describe 'sessions/new', type: :view do
  describe 'sign in template' do
    it 'renders the sign in page' do
      render
      expect(rendered).to match(/text/)
    end
  end
end

RSpec.describe 'sessions/new.html.erb' do
  it 'renders the HTML template' do
    render
    expect(rendered).to match 'username'
  end
end
