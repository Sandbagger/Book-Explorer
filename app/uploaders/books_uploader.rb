class BooksUploader < Shrine
  def generate_location(io, context)
    "#{SecureRandom.uuid}_#{context[:record]["filename"]}"
  end
end