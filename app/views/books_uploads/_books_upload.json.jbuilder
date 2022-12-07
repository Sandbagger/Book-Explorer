json.extract! books_upload, :id, :name, :url, :attachment_data, :created_at, :updated_at
json.url books_upload_url(books_upload, format: :json)
