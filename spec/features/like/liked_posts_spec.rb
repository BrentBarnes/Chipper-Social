
require 'rails_helper'

RSpec.describe 'Liked posts', type: :feature do
  before(:all) do
    page.driver.browser.manage.window.maximize
  end

  scenario 'click on liked posts link' do
    like = create(:like, :for_post)
    sign_in like.user
    visit posts_path

    click_on "Liked Posts"
    expect(page).to have_content("Test post")
  end
end
