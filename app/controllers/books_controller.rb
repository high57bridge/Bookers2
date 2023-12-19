class BooksController < ApplicationController

before_action :ensure_current_user, {only:[:edit, :update]}

  def ensure_current_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books\path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]= "You have created the book successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert]= "Book was posting failed"
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update
      flash[:notice] = "You have updated the book successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was updating failed"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end
