class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friendships = Friendship.to_be_confirmed.where(friend_id: current_user.id)
  end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      redirect_to root_path, notice: 'Friendship request sent!'
    else
      flash[:notice] = 'Something went wrong!'
      render :users
    end
  end

  def update
    @friendship = Friendship.find(params[:id])

    @friendship.confirmed = true

    if @friendship.save
      redirect_to friendships_path, notice: 'Friendship request accepted!'
    else
      flash[:notice] = 'Something went wrong, please try again!'
      render 'friendships#index'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    redirect_to friendships_path, notice: 'Request rejected!'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end
