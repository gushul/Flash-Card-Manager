class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  scope :review_before, -> { where("review_date < ?", Date.today).take }

  def check_translation(translate)
    translate == translated_text
  end

end
