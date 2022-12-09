class BooksUpload < ApplicationRecord
    include BooksUploader::Attachment(:attachment)
    include ActiveModel::Validations
    validates_with UniqueBookIdValidator
end
