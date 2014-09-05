# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "joe.doew@gmail.com"
    password "abcdabcd"
    password_confirmation "abcdabcd"
  end
end
