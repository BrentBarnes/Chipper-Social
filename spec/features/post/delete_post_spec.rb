
require 'rails_helper'

RSpec.describe 'Delete post', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'when push delete button' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    click_on 'delete'
    expect(page).to_not have_content("Test post")
  end
end
