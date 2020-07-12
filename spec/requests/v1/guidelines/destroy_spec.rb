require 'rails_helper'

RSpec.describe 'DELETE /v1/guidelines/:guideline_display_id', type: :request do
  let(:path) { "http://example.com/v1/guidelines/#{guideline.display_id}" }

  let(:guideline) do
    create(:guideline) do |guideline|
      create_list(:step, 3, guideline_id: guideline.id)
    end
  end

  it '200 okを返す' do
    delete path

    expect(response).to have_http_status(:ok)
    expect(Guideline.all.count).to eq 0
  end
end
