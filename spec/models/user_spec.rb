require 'rails_helper'

describe User do
  before { @user = build(:user) }

  context "must have email and password" do
    it { expect(@user).to respond_to(:email) }
    it { expect(@user).to respond_to(:password_digest) }
    it { expect(@user).to respond_to(:password) }
    it { expect(@user).to respond_to(:password_confirmation) }
  end
  it { expect(@user).to be_valid  }

  context "without " do
    it "password" do
      @user.password_digest = ""
      expect(@user).to_not be_valid
    end
    it "email" do
      @user.email = ""
      expect(@user).to_not be_valid
    end
  end

  context "not correct" do
    it "password to short" do
      @user.password_digest = "auaoe"
      expect(@user).to_not be_valid
    end
    it "wrong email" do
      @user.email = "jen.ouao.com"
      expect(@user).to_not be_valid
    end
  end

  describe "email already teaken" do
    before do
      user_same_email = @user.dup
      user_same_email.save
    end
    it { should_not be_valid }
  end
  describe "password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end
