require 'spec_helper'

describe "player creation", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', password: 'swordfish', password_confirmation: 'swordfish')
    
    visit '/login'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'swordfish'

    click_button 'Log in'

    click_link 'Create a Team'
    fill_in 'name', with: 'Sharks'
    fill_in 'description', with: 'Varsity Water Polo'
    click_button 'Create Team'
  end

  it "creates a player" do

    fill_in 'name', with: 'Greg'
    fill_in 'email', with: 'greg@greg.edu'

    click_button 'Add Player'

    expect(page).to have_content 'Greg'
  end
end