require 'rails_helper'

RSpec.describe 'Create comment', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'valid inputs' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    click_on 'Comment'
    fill_in 'Write a comment...', with: 'Test comment'
    click_on 'Post'
    expect(page).to have_content('Test comment')
  end
end