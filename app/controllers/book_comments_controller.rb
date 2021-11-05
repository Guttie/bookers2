class BookCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def create
    @book = Book.find(params[:book_id])
    book_comment = BookComment.new(book_comment_params)
    book_comment.user_id = current_user.id
    if book_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end
