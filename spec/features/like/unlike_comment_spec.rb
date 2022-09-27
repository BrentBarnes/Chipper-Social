
require 'rails_helper'

RSpec.describe 'Unlike comment', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'unliking liked comment' do
    like = create(:like, :for_comment)
    sign_in like.user
    visit posts_path
    expect(page).to have_content("Test post")

    click_on 'Comment'
    expect(page).to have_content('Test comment')

    comment_like_count = find('.comment-like-count')
    expect(comment_like_count).to have_content('1')

    click_on 'Unlike'
    expect(comment_like_count).to have_content('0')
  end
end
