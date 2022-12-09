class BooksUploadsController < ApplicationController
  before_action :set_books_upload, only: %i[ show edit update destroy ]

  # GET /books_uploads or /books_uploads.json
  def index
    @books_uploads = BooksUpload.all
    authorize @books_uploads
  end

  # GET /books_uploads/1 or /books_uploads/1.json
  def show
    @books = @books_upload.attachment.read
    authorize @books_upload
  end

  # GET /books_uploads/new
  def new
    @books_upload = BooksUpload.new
    authorize @books_upload
  end

  # GET /books_uploads/1/edit
  def edit
  end

  # POST /books_uploads or /books_uploads.json
  def create
    @books_upload = BooksUpload.new(books_upload_params)
    authorize @books_upload
    respond_to do |format|
      if @books_upload.save!
        @books_upload.update(url: @books_upload.attachment_url, name: @books_upload.attachment.original_filename)
        format.html { redirect_to books_upload_url(@books_upload), notice: "Books upload was successfully created." }
      else
        format.html do
          flash.now[:alert] = "Error"
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /books_uploads/1 or /books_uploads/1.json
  def update
    respond_to do |format|
      if @books_upload.update(books_upload_params)
        format.html { redirect_to books_upload_url(@books_upload), notice: "Books upload was successfully updated." }
        format.json { render :show, status: :ok, location: @books_upload }
      else
        format.html do
          flash.now[:alert] = "Please fix errors below."
           render :edit, status: :unprocessable_entity 
        end
       
      end
    end
  end

  # DELETE /books_uploads/1 or /books_uploads/1.json
  def destroy
    @books_upload.destroy

    respond_to do |format|
      format.html { redirect_to books_uploads_url, notice: "Books upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books_upload
      @books_upload = BooksUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def books_upload_params
      params.require(:books_upload).permit(:name, :url, :attachment)
    end
end
