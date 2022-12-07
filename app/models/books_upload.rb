class BooksUpload < ApplicationRecord
    include BooksUploader::Attachment(:attachment)
end
