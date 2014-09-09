require 'rails_helper'


describe " sign up" do
  it"Create user successful" do
    visit signup_path
    fill_in "Email", with: "jonDoen@mail.com"
    fill_in "Password", with: "fooobaar"
    fill_in "Password confirmation", with: "fooobaar"

    expect { click_button  "Create my account"}.to change(User, :count).by(1)
  end
  
  describe "Create user fail" do
    before do 
      visit signup_path
    end
    it"with invalid email" do
      fill_in "Email", with: "jonDoenmail.com"
      fill_in "Password", with: "fooobaar"
      fill_in "Password confirmation", with: "fooobaar"
      expect { click_button  "Create my account"}.not_to change(User, :count)
    end
    
    it "without pass" do
      fill_in "Email", with: "jonDoen@mail.com"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: "fooobaar"
      expect { click_button  "Create my account"}.not_to change(User, :count)
    end
    
    it "without pass confirm" do
      fill_in "Email", with: "jonDoen@mail.com"
      fill_in "Password", with: "fooobaar"
      fill_in "Password confirmation", with: ""
      expect { click_button  "Create my account"}.not_to change(User, :count)
    end
  end
    
end

describe "sign in" do
  before do
    @user = FactoryGirl.create(:user)
    visit signin_path
  end
  
  it "Sign in successful" do
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    
    click_button "Sign in"

    expect(page).to have_content "You signed in"
  end
  
  describe "Sign in fail" do
    it "With not correct email" do
      fill_in "Email", with: "jon@smit.com"
      fill_in "Password", with: @user.password
    
      click_button "Sign in"

      expect(page).not_to have_content "You signed in"
    end
    
    it "With not correct pass" do
      fill_in "Email", with: @user.email
      fill_in "Password", with: "foobar"
    
      click_button "Sign in"

      expect(page).not_to have_content "You signed in"
    end
  end
end

describe "sign out" do
  it "user signs out successfully" do
    @user = FactoryGirl.create(:user)
    visit signin_path
    
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Sign in"

    expect(page).to have_content "You signed in"
    
    click_link "Выйти"

    expect(page).to have_content "Зарегестрируйтесь или войдите"
  end
end
