require 'rails_helper'

RSpec.describe 'DELETE /v1/guidelines/:guideline_display_id/steps/:display_id', type: :request do
  let(:path) { "http://example.com/v1/guidelines/#{guideline.display_id}/steps/#{step.display_id}" }

  let(:guideline) do
    create(:guideline) do |guideline|
    end
  end

  let(:step) { create(:step, guideline_id: guideline.id) }

  it '200 okを返す' do
    delete path

    expect(response).to have_http_status(:ok)
    expect(guideline.steps.count).to eq 0
  end
end
