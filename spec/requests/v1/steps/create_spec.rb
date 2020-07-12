require 'rails_helper'

RSpec.describe 'POST /v1/guidelines/:guideline_display_id/steps', type: :request do
  let(:path) { "http://example.com/v1/guidelines/#{guideline.display_id}/steps" }

  let!(:guideline) { create(:guideline) }

  let(:params) do
    {
      step: {
        title: 'title',
        position: 0,
      },
    }
  end

  it 'createdを返す' do
    post path, params: params

    expect(response).to have_http_status(:created)
  end
end
