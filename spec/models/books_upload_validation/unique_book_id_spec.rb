require "rails_helper"
require 'csv'
RSpec.describe "BooksUploadValidation::UniqueBookId" do
  let(:valid_csv){"title,author,date_published,id,publisher_name\r\nAmazing world of spam,Testy McTest,23-11-1999,123,Book Publisher" }
  let(:invalid_csv){"title,author,date_published,id,publisher_name\r\nAmazing world of spam,Testy McTest,23-11-1999,123,Book Publisher\r\nAmazing world of spam,Testy McTest,23-11-1999,123,Book Publisher" }
  it 'valid' do
    expect(BooksUploadValidation::UniqueBookId.new(valid_csv).call).to eq true
  end

  it 'valid' do
    expect(BooksUploadValidation::UniqueBookId.new(invalid_csv).call).to eq false
  end
end