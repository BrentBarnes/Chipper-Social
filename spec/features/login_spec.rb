require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  scenario 'valid inputs' do
    user = create(:user)

    visit new_user_session_path
    fill_in 'user_email', with: 'Dan@gmail.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'invalid inputs' do
    user = create(:user)

    visit new_user_session_path
    fill_in 'user_email', with: 'Dan@gmail.com'
    fill_in 'user_password', with: 'Not the password'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end