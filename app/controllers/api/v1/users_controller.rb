class  Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :add_to_upvotes, :remove_from_upvotes]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    if @user
      render json: @user, status: :ok
    else
      render json: {error: 'failed to locate user'}, status: :not_acceptable
    end
  end

  def add_to_upvotes
    @chirp = Chirp.find(params[:chirp][:id])
    if @user && @chirp
      @user.upvoted_for << @chirp unless @user.upvoted_for.include?(@chirp)
      render json: @user, status: :created
    else
      render json: {error: 'failed to add upvotes'}, status: :not_acceptable
    end
  end

  def remove_from_upvotes
    @chirp = Chirp.find(params[:chirp][:id])
    @user.upvoted_for.delete(@chirp)
    render json: @user, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
