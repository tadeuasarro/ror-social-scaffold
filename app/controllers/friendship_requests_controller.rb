class FriendshipRequestsController < ApplicationController

  def create
    friendship_request = FriendshipRequest.new(friendship_request_params)
  end

  private

  def friendship_request_params
    params.require(:friendship_request).permit(:user_id, :friend_id)
  end
end
