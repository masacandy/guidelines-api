# frozen_string_literal: true

module V1
  class StepSerializer
    include FastJsonapi::ObjectSerializer
    attributes :display_id, :title, :description, :position, :remark, :image_url
  end
end
