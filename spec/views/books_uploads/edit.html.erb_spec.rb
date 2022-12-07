require 'rails_helper'

RSpec.describe "books_uploads/edit", type: :view do
  let(:books_upload) {
    BooksUpload.create!(
      name: "MyString",
      url: "MyString",
      attachment_data: "MyText"
    )
  }

  before(:each) do
    assign(:books_upload, books_upload)
  end

  it "renders the edit books_upload form" do
    render

    assert_select "form[action=?][method=?]", books_upload_path(books_upload), "post" do

      assert_select "input[name=?]", "books_upload[name]"

      assert_select "input[name=?]", "books_upload[url]"

      assert_select "textarea[name=?]", "books_upload[attachment_data]"
    end
  end
end
