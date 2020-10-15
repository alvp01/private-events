require 'rails_helper'
RSpec.describe 'Users', type: :request do
  it 'renders the new user page' do
    get '/users/new'
    expect(response).to render_template(:new)

    # expect(response).to render_template(:show)
    # expect(response.body).to include("Widget was successfully created.")
  end

  it 'redirects to create user page' do
    post '/users', params: { user: { username: 'My Widget' } }
    expect(response).to redirect_to(user_path(1))
  end
end
