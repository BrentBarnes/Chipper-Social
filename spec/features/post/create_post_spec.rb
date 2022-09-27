require 'rails_helper'

RSpec.describe 'Create post', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end
  
  scenario 'valid inputs' do
    user = create(:user)
    sign_in user
    visit posts_path

    fill_in "What's on your mind?", with: "Test Post"
    click_on "Post"
    expect(page).to have_content("Test Post")
  end

  scenario 'invalid inputs' do
    user = create(:user)
    sign_in user
    visit posts_path
sleep(2)
    click_on "Post"
    sleep(2)
    expect(page).to have_content("Your post was unable to be submitted.")
  end
end