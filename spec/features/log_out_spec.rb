require 'rails_helper'

RSpec.describe 'Logging out', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'push signout button' do
    user = create(:user)
    sign_in user
    visit new_user_session_path
    sleep(2)
    
    click_on 'Sign Out'
    sleep(2)
    expect(page).to has_content?("Log in")
  end
end