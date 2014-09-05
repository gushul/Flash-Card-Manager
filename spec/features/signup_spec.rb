require 'rails_helper'


feature " sign up" do
  scenario "Create user successful" do
      visit signup_path
      fill_in "Email", with: "jonDoen@mail.com"
      fill_in "Password", with: "fooobaar"
      fill_in "Password confirmation", with: "fooobaar"

      expect { click_button  "Create my account"}.to change(User, :count).by(1)
  end
end
