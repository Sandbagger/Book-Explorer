require 'rails_helper'

RSpec.describe "books_uploads/new", type: :view do
  before(:each) do
    assign(:books_upload, BooksUpload.new(
      name: "MyString",
      url: "MyString",
      attachment_data: "MyText"
    ))
  end

  it "renders new books_upload form" do
    render

    assert_select "form[action=?][method=?]", books_uploads_path, "post" do

      assert_select "input[name=?]", "books_upload[name]"

      assert_select "input[name=?]", "books_upload[url]"

      assert_select "textarea[name=?]", "books_upload[attachment_data]"
    end
  end
end
