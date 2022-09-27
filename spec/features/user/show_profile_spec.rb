
require 'rails_helper'

RSpec.describe 'Go to profile', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'click on profile link' do
    user = create(:user)
    sign_in user
    visit posts_path

    click_on 'Profile'
    expect(page).to have_content('view all posts')
  end

  scenario 'click on div in navbar' do
    user = create(:user)
    sign_in user
    visit posts_path

    find('.nav-profile').click
    expect(page).to have_content('view all posts')
  end

  scenario 'click on post avatar' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path

    find('.post-avatar').click
    expect(page).to have_content('view all posts')
  end

  scenario 'click on post name' do
    user = create(:user)
    post = create(:post)
    sign_in user
    visit posts_path

    find('.post-name').click
    expect(page).to have_content('view all posts')
  end
end