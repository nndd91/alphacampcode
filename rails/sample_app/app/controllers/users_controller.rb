class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #yaml = @user.attributes.to_yaml
    #puts yaml
    #debugger

  end

  def index
  end


end
