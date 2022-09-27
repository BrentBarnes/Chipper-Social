
require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'delete friend request' do
    user = create(:user, :user_2)
    invitation = create(:invitation)
    sign_in user
    visit posts_path
    click_on 'Friend Requests'
    expect(page).to have_button("Accept")
    expect(page).to have_button("Decline")
    click_on 'Decline'
    expect(page).to_not have_button('Decline')
  end
end
