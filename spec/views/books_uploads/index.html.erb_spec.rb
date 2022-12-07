require 'rails_helper'

RSpec.describe "books_uploads/index", type: :view do
  before(:each) do
    assign(:books_uploads, [
      BooksUpload.create!(
        name: "Name",
        url: "Url",
        attachment_data: "MyText"
      ),
      BooksUpload.create!(
        name: "Name",
        url: "Url",
        attachment_data: "MyText"
      )
    ])
  end

  it "renders a list of books_uploads" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
