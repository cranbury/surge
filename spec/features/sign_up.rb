require 'spec_helper'

describe "the sign up process", :type => :feature do

  it "signs me up" do
    visit '/'

    click_link 'Sign Up'

    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'swordfish'
    fill_in 'password_confirmation', with: 'swordfish'

    click_button 'Sign Up'
    expect(page).to have_content 'user@example.com'
  end
end