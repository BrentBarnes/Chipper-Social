
require 'rails_helper'

RSpec.describe 'Unlike post', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'unliking liked post' do
    like = create(:like, :for_post)
    sign_in like.user
    visit posts_path
    expect(page).to have_content("Test post")

    like_count = find('.post-like-count')
    expect(like_count).to have_content('1')

    find('.fa-thumbs-up').click
    expect(like_count).to have_content('0')
  end
end
