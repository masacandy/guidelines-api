# frozen_string_literal: true

class Guideline < ApplicationRecord
  has_many :steps, dependent: :destroy

  before_create :set_display_id

  private

  def set_display_id
    result = SecureRandom.alphanumeric(20)
    return set_display_id if self.class.find_by(display_id: result)

    self.display_id = result
  end
end
