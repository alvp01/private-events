require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  it 'renders the sign in page' do
    get '/sessions/new'
    expect(response).to render_template(:new)
  end

  it 'redirects to sign in page when the user does no exists' do
    post '/sessions', params: { session: { username: 'My Widget' } }
    expect(response).to redirect_to(new_session_path)
  end
end
