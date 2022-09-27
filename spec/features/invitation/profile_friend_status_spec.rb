
require 'rails_helper'

RSpec.describe 'Profile Friend Status', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'not friends yet' do
    user = create(:user)
    user_2 = create(:user, :user_2)
    sign_in user
    visit posts_path
    click_on user_2.full_name
    expect(page).to have_button("Add Friend")
  end

  scenario 'request sent' do
    user = create(:user, :user_2)
    invitation = create(:invitation)
    sign_in user
    visit posts_path
    click_on invitation.user.full_name
    expect(page).to have_content("Request Received")
  end

  scenario 'request accepted' do
    user = create(:user, :user_2)
    invitation = create(:invitation)
    sign_in user
    visit posts_path
    click_on 'Friend Requests'
    click_on 'Accept'
    click_on invitation.user.full_name
    expect(page).to have_content('Friends!')
  end
end
