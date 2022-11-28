require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_contact) { FactoryBot.create(:contact) }

      before do
        post '/posts', params:
                          { post: {
                            title: my_contact.title,
                            content: my_contact.text
                          } }
      end

      it 'returns the title' do
        expect(json['title']).to eq(my_post.title)
      end

      it 'returns the content' do
        expect(json['content']).to eq(my_post.content)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/contacts', params:
                          { post: {
                            title: '',
                            text: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end