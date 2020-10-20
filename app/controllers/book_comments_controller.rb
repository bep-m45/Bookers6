class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    @book_comment = BookComment.new
    if comment.save
    else
      @user = @book.user
      @books = @user.books
      @book_new = Book.new
    render 'show'

    end
  end


  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy


  end

  private
    def book_comment_params
     params.require(:book_comment).permit(:comment)
    end
end
