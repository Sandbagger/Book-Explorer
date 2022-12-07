require 'rails_helper'

RSpec.describe "books_uploads/show", type: :view do
  before(:each) do
    assign(:books_upload, BooksUpload.create!(
      name: "Name",
      url: "Url",
      attachment_data: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
  end
end
