
require 'rails_helper'

RSpec.describe 'My posts', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'click my posts link' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit root_path
    click_on "My Posts"
    expect(page).to have_content("Test post")
  end
end