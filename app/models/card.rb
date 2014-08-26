class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  scope :review_before, -> { where("review_date <= ?", Date.today) }

  def check_translation(translate)
    translate == translated_text
  end

  def update_review
    update_attribute(:review_date, (Time.now + 3.day))
  end

end
