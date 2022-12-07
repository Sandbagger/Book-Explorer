class CreateBooksUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :books_uploads do |t|
      t.string :name
      t.string :url
      t.text :attachment_data

      t.timestamps
    end
  end
end
