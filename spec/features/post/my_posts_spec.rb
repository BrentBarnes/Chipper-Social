
require 'rails_helper'

RSpec.describe 'My posts', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'click my posts link' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    click_on "My Posts"
    expect(page).to have_content("Test post")
  end
end