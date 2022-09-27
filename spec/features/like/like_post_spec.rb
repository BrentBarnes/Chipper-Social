require 'rails_helper'

RSpec.describe 'Like post', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'liking unliked post' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    click_on 'Like'
    like_count = find('.post-like-count')
    expect(like_count).to have_content('1')
  end

  scenario 'without pushing like' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    like_count = find('.post-like-count')
    expect(like_count).to have_content('0')
  end
end