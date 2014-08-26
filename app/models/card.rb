class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  def checking_translation(translate)
    translate == translated_text
  end

end
