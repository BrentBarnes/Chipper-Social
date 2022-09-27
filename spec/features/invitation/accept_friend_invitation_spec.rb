
require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'accept friend request' do
    user = create(:user, :user_2)
    invitation = create(:invitation)
    sign_in user
    visit posts_path
    click_on 'Friend Requests'
    click_on 'Accept'
    click_on 'My Friends'
    expect(page).to have_content('Dan Danielson')
  end
end
