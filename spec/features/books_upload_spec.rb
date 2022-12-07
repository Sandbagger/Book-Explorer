require "rails_helper"

RSpec.describe "Upload Books CSV", :type => :feature, js: true  do
  scenario "User uploads a books csv" do
    visit ""

    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Confirm password'

    fill_in 'Email', with: 'will@example.com' 
    fill_in 'Password', with: 'password' 
    fill_in 'Confirm password', with: 'password' 

    click_on 'Register'
    
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Url'
    expect(page).to have_field 'Attachment data'
  end
end