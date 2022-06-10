FactoryGirl.define do
  factory :card do
    original_text "Hello"
    translated_text "Hi"
    review_date Date.today
    user_id "1"
  end
end
