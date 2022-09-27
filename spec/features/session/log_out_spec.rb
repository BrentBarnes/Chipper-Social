require 'rails_helper'

RSpec.describe 'Logging out', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'push signout button' do
    user = create(:user)
    sign_in user
    visit new_user_session_path
    
    click_on 'Sign Out'
    expect(page).to have_button("Log in")
  end
end