
require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'Send friend request' do
    user = create(:user)
    user_2 = create(:user, :user_2)
    sign_in user
    visit posts_path
    click_on 'Find Friends'
    click_on 'Add Friend'
    
    expect(page).to have_content('Request Sent')
  end
end
