class BoardsController < ApplicationController
  
  before_filter :authenticate_user!

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "Your board has created"
      redirect_to @board
    end

  end
 
  def show
    @board = Board.find(params[:id])
  end
 
  def search
    @category = Category.find(params[:id])
    @boards  = @category.boards
    render 'index'
  end
 
  private

  def board_params
    params.require(:board).permit(:name,:description,:categories_name).merge(:user_id => current_user.id)
  end

end
