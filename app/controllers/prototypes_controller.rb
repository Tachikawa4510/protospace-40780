class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @prototypes = Prototype.all
  end
  def new
    @prototype = Prototype.new
  end
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comment.includes(:user)
  end
  def edit
    @prototype = Prototype.find(params[:id])
  end
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end
  def update
    @prototype = Prototype.find(params[:id])
    @prototype.user = current_user
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.user = current_user
  
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def prototype_params
  params.require(:prototype).permit(:title, :catch_copy,:content,:image)
  end
  def correct_user
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end
end
