require 'csv'
module BooksUploadValidation
  class UniqueBookId
    def initialize(csv)
      @csv = CSV.parse(csv)
    end

    def call
      ids = @csv.map{| book | book[3]}
 
      ids.uniq.length == ids.length
    end
  end
end