require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /index' do
    context 'when the page is loaded' do
      it 'returns a correct response and renders the correct template' do
        get '/users/1/posts'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
        expect(response.body).to include('Index Posts')
      end
    end
  end

  describe 'GET /show' do
    context 'when the page is loaded' do
      it 'returns correct response and renders the correct template' do
        get '/users/1/posts/1'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
        expect(response.body).to include('Show Post')
      end
    end
  end
end
