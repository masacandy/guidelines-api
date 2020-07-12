require 'rails_helper'

RSpec.describe 'PUT /v1/guidelines/:guideline_display_id', type: :request do
  let(:path) { "http://example.com/v1/guidelines/#{guideline.display_id}" }

  let(:guideline) do
    create(:guideline) do |guideline|
      create_list(:step, 3, guideline_id: guideline.id)
    end
  end

  let(:params) do
    {
      guideline: {
        title: 'updated',
        description: 'updated',
      },
    }
  end

  it '200 okを返す' do
    put path, params: params

    expect(response).to have_http_status(:ok)
    attributes = JSON.parse(response.body)['data']['attributes']
    expect(attributes['title']).to eq 'updated'
    expect(attributes['description']).to eq 'updated'
  end
end
