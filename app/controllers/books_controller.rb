class BooksController < ApplicationController

  def new
  end

  def create
    # book = Book.find(params[:id])
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render:index
    end
    
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
    book = Book.find(params[:id])
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
