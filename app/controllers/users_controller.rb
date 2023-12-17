class UsersController < ApplicationController
 
 def index 
   @books = Book.find(params[:id])
   @book = Book.new
   @user = current_user
 end
 
def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]= "Book was successfully created"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert]= "Book was posting failed"
      @user = current_user
      render :index
    end
end
 
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Book was successfully updated"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Book was updating failed"
      render :edit
    end
  end
 
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
