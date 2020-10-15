class FriendshipRequestsController < ApplicationController
  def create
    friendship_request = FriendshipRequest.new(friendship_request_params)
    if friendship_request.save
      redirect_to users_path, notice: 'The request has been sent!'
    else
      flash[:notice] = 'Something went wrong, please try again later!'
      render 'users/'
    end
  end

  private

  def friendship_request_params
    params.require(:friendship_request).permit(:user_id, :friend_id)
  end
end
