require 'rails_helper'

RSpec.describe 'Edit post', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'valid inputs' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    find('.fa-pen-to-square').click

    find('.edit-post-box').fill_in with: "Edited test post"
    find('.edit-submit').click
    expect(page).to have_content('Edited test post')
  end

  scenario 'no change' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path
    expect(page).to have_content("Test post")

    find('.fa-pen-to-square').click
    find('.edit-submit').click
    expect(page).to have_content("Test post")
  end
end