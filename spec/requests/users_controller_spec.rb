require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe 'GET /' do
    context 'when the page is loaded' do
      it 'return a correct response' do
        get '/'
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'GET /index' do
    context 'when the page is loaded' do
      before do
        get '/users/'
      end
      it 'returns the correct response' do
        expect(response).to have_http_status(200)
      end
      it 'renders the correct index template' do
        expect(response).to render_template('index')
        expect(response.body).to include('Index Users')
      end
    end
  end
  describe 'GET /show' do
    context 'when the page is loaded' do
      before do
        get '/users/1'
      end
      it 'returns the correct response' do
        expect(response).to have_http_status(200)
      end
      it 'renders the correct template' do
        expect(response).to render_template('show')
        expect(response.body).to include('Show User')
      end
    end
  end
end
