require 'spec_helper'

describe "the sign in process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', password: 'swordfish', password_confirmation: 'swordfish')
  end

  it "signs me in" do
    visit '/login'

    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'swordfish'

    click_button 'Log in'
    expect(page).to have_content 'user@example.com'
  end
end