require 'rails_helper'

RSpec.describe 'POST /v1/guidelines', type: :request do
  let(:path) { 'http://example.com/v1/guidelines' }

  let(:params) do
    {
      guideline: {
        title: 'title',
        description: 'description',
      },
    }
  end

  it 'createdを返す' do
    post path, params: params

    expect(response).to have_http_status(:created)
  end
end
