require 'rails_helper'

describe Card do
  before do
    @card = Card.create!(original_text: "Hello", translated_text: "Hi", review_date: Date.today )
  end
  
  context "#check_translation" do
    it "valid translation" do
      expect(@card.check_translation("Hi")).to eq true
    end
  
    it "invalid translation" do
      expect(@card.check_translation("Hii")).to eq false
    end
  end
  
  context "#update_review_date" do
    it "changes review date by 3 day" do
      @card.update_review_date
      expect(@card.review_date).to eq(Date.today + 3.day) 
    end
  end
end
