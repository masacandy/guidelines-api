# frozen_string_literal: true

module V1
  class GuidelineSerializer
    include FastJsonapi::ObjectSerializer

    attributes :display_id, :title, :description

    has_many :steps
  end
end
