class BooksController < ApplicationController

  def index
    @user = current_user
    @newbook = Book.new
    @books = Book.all
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user = current_user
    if @newbook.save
      redirect_to book_path(@newbook.id), notice: "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @user = current_user
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
