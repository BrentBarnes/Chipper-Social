
require 'rails_helper'

RSpec.describe 'About', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize #Mention it here
  end

  scenario 'about link pressed' do
    user = create(:user)
    sign_in user
    visit posts_path

    click_on 'About'
    expect(page).to have_content("Created by Brent Barnes")
  end
end
