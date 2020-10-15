class ActiveFriendshipsController < ApplicationController
  def create
    first_active_friendship = ActiveFriendship.new(active_friendship_param)
    second_active_friendship = create_second_friendship(first_active_friendship)

    if first_active_friendship.save && second_active_friendship.save
      redirect_to friendship_requests_path, notice: 'Friend accepted'
    else
      flash[:notice] = 'Something went wrong, please try again later!'
      render 'friendship_requests#index'
    end
  end

  private

  def active_friendship_param
    params.require(:active_friendship).permit(:user_id, :friend_id)
  end

  def create_second_friendship(first)
    friendship = ActiveFriendship.new(
      user_id: first.friend_id,
      friend_id: first.user_id
    )
  end
end
