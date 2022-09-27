require 'rails_helper'

RSpec.describe 'Delete comment', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'pushing delete button' do
    user = create(:user)
    comment = create(:comment)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")
    click_on 'Comment'
    expect(page).to have_content("Test comment")
    click_on 'delete'
    expect(page).to_not have_content("Test comment")
    sleep 2
  end
end
