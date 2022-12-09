class UniqueBookIdValidator < ActiveModel::Validator
  def validate(record)
    csv_string = record.attachment.read
    if BooksUploadValidation::UniqueBookId.new(csv_string).call
      record.errors.add :attachment, "Book ID needs to be unique"
    end
  end
end