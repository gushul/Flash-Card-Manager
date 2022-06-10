require 'rails_helper'

describe "Review_translate" do
  before do
    @card = FactoryGirl.create(:card)
    @user = FactoryGirl.create(:user)
    visit signin_path
    fill_in "Password", with: @user.password
    fill_in "Email", with: @user.email
    click_button "Sign in"
  end

  context "doesn't input text" do
    it "empty input fieald" do
      fill_in "translate", with: ""
      click_button "Проверить"
      expect(page).to have_content "Wrong translate"
    end
  end
  context "with input text" do
    it "input right text" do
      fill_in "translate", with: "Hi"
      click_button "Проверить"
      expect(page).to have_content "Awesome! Try next card!"
    end

    it "input wrong text" do
      fill_in "translate", with: "HI"
      click_button "Проверить"
      expect(page).to have_content "Wrong translate"
    end
  end


end
