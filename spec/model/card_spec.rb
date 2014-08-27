require 'rails_helper'


RSpec.describe Card, :type => :model do
  before do
    @card = Card.create!(original_text: "Hello", translated_text: "Hi", review_date: Time.now )
  end
  it "method chek_translation must return true" do
    expect(@card.check_translation("Hi")).to eq true
  end
  it "method chek_translation must return false" do
    expect(@card.check_translation("Hii")).to eq false
  end
  it "method update_review_date must change Date + 3 day" do
    @card.update_review_date
    expect(@card.review_date.to_date).to eq(Date.today + 3.day) 
  end
  it "method update_review_date must be false" do
    @card.update_review_date
    expect(@card.review_date.to_date).to_not eq(Date.today) 
  end
end
