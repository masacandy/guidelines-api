# frozen_string_literal: true

class Step < ApplicationRecord
  has_one_attached :file

  belongs_to :guideline

  before_create :set_display_id

  # TODO: ActiveStorageから持ってくる
  def image_url
    'https://data.smart-flash.jp/wp-content/uploads/2018/06/11103614/o-dori-1.jpg'
  end

  private

  def set_display_id
    result = SecureRandom.alphanumeric(20)
    return set_display_id if self.class.find_by(display_id: result)

    self.display_id = result
  end
end
