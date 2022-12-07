require "rails_helper"

RSpec.describe "Upload Books CSV", :type => :feature, js: true  do
  scenario "User uploads a books csv" do
    visit ""
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Url'
    expect(page).to have_field 'Attachment data'
  end
end