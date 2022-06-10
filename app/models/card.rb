class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validates :user_id, presence: true

  belongs_to :user,  dependent: :delete
  scope :pending, -> { where("review_date <= ?", Date.today) }

  def check_translation(translate)
    translate == translated_text
  end

  def update_review_date
    update_attribute(:review_date, (Date.today + 3.day))
  end

end
