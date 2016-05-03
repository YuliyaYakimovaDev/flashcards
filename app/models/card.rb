class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true, on: :create
  validates :original_text, uniqueness: true, on: :create
  validate :check_original_and_translated_text, on: :create
  validate :check_text_register, on: :create
  before_create :set_time_to_now

  def check_original_and_translated_text
    if original_text == translated_text
      errors.add(:original_text, "can't be similar as translated text")
    end
  end

  def check_text_register
    if original_text == translated_text.capitalize
      errors.add(:original_text, "can't be similar as translated text")
    end
  end

  def set_time_to_now
    self.review_date = Time.now + 3.days
  end
end
