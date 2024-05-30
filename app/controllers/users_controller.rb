class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:show] 
  before_action  only: [:show]
  def show
    @user = current_user
    @prototypes = @user.prototypes
  end
end
