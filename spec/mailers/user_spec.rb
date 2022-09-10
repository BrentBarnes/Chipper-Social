require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome email" do
    before do
      @user = build(:user)
      @mail = UserMailer.with(user: @user).welcome_email
    end
    
    it "renders the headers" do
      expect(@mail.subject).to eq("Welcome to Hobbyist!")
      expect(@mail.to).to eq(["Dan@gmail.com"])
      expect(@mail.from).to eq(["Brent@hobbyist.com"])
    end

    it "renders the body" do
      # expect(@mail.body.encoded).to include("Welcome to Hobbyist!")
      expect(@mail.body.encoded).to include("Thanks for joining and have a great day!")
    end
  end
end
