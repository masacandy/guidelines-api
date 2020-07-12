require 'rails_helper'

RSpec.describe 'PUT /v1/guidelines/:guideline_display_id/steps/:display_id', type: :request do
  let(:path) { "http://example.com/v1/guidelines/#{guideline.display_id}/steps/#{step.display_id}" }

  let(:guideline) do
    create(:guideline) do |guideline|
    end
  end

  let(:step) { create(:step, guideline_id: guideline.id) }

  let(:params) do
    {
      step: {
        title: 'updated',
      },
    }
  end

  it '200 okを返す' do
    put path, params: params

    expect(response).to have_http_status(:ok)
    attributes = JSON.parse(response.body)['data']['attributes']
    expect(attributes['title']).to eq 'updated'
  end
end
