class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  def self.new_review
    find_review = self.select { |card| card.review_date.to_i <= Time.now.to_i }
    return find_review.sample(1)
  end

end
