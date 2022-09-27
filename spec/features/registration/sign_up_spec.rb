require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'valid inputs' do
    user = create(:user)
    visit new_user_session_path
    click_on 'Sign up'

    fill_in 'Email', with: 'Test@gmail.com'
    fill_in 'Full name', with: 'Test Example'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Test Example')
  end

  scenario 'invalid inputs' do
    user = create(:user)
    visit new_user_session_path
    click_on 'Sign up'
    # no form inputs
    click_on 'Sign up'

    expect(page).to have_content('Sign up')
  end
end