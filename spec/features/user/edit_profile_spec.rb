
require 'rails_helper'

RSpec.describe 'Edit Profile', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'click on edit profile link' do
    user = create(:user)
    sign_in user
    visit posts_path
    click_on 'Edit Profile'
    expect(page).to have_button('Update')
  end

  scenario 'updates user information' do
    user = create(:user)
    sign_in user
    visit posts_path
    click_on 'Edit Profile'

    fill_in 'Location', with: 'New York'
    fill_in 'Education', with: 'The Odin Project'
    fill_in 'Occupation', with: 'Developer'
    fill_in 'Birthday', with: '01/01/2000'
    
    click_on 'Update'
    expect(page).to have_content('New York')
    expect(page).to have_content('The Odin Project')
    expect(page).to have_content('Developer')
    expect(page).to have_content('January 01, 2000')
  end
end