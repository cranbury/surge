require 'spec_helper'

describe "the sign in process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', password: 'swordfish', password_confirmation: 'swordfish')
    
    visit '/login'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'swordfish'

    click_button 'Log in'
  end

  it "creates a team" do

    click_link 'Create a Team'

    fill_in 'Team Name', with: 'Sharks'
    fill_in 'Description', with: 'Varsity Water Polo'

    click_button 'Submit'

    expect(page).to have_content 'Sharks'
  end
end