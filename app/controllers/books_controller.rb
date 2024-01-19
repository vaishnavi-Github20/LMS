class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def issue_book
    @book = Book.find(params[:id])
    if current_user && current_user.role.eql?('student')
      # Render the new view for book issuance
      render 'issue_book'
    else
      redirect_to @book, alert: 'You are not authorized to issue books.'
    end
    # Send the email
  BookMailer.issue_confirmation(@book, current_user).deliver_now
  # Redirect to the confirmation page
  # redirect_to root_path
  end

  def confirm_issue_book
    @book = Book.find(params[:id])
    # Implement book issuance logic here
    # You can update the book's status, create a BookIssue record, etc.
    # Example:
    BookIssue.create(book: @book, user: current_user, due_date: Time.now + 14.days)
    # Send email notification
    BookMailer.book_due_notification(current_user, @book).deliver_later(wait_until: 2.days.from_now)
    # Redirect or render as needed
    redirect_to @book, notice: 'Book issued successfully.'

    BookIssue.create(book: @book, user: current_user, due_date: Time.now + 14.days)

  # Schedule email reminder
  DueDateReminderJob.set(wait_until: (Time.now + 12.days).beginning_of_day).perform_later(@book, current_user)
  end


#   BookIssue.create(book: @book, user: current_user, due_date: Time.now + 14.days)

# # Schedule email reminder
#   DueDateReminderJob.set(wait_until: (Time.now + 12.days).beginning_of_day).perform_later(@book, current_user)

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:isbn, :title, :author, :language, :published, :edition, :associated_library, :cover_page, :summary, :special_collection)
    end
end
