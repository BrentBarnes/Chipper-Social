require 'rails_helper'

RSpec.describe 'Like comment', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'pushing like button' do
    user = create(:user)
    comment = create(:comment)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")
    
    click_on 'Comment'
    expect(page).to have_content("Test comment")
    
    find('.comment-like-btn').click
    comment_like_count = find('.comment-like-count')
    expect(comment_like_count).to have_content('1')
  end
end