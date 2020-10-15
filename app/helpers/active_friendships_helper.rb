module ActiveFriendshipsHelper
  def accept_button(request)
    link = capture do
      link_to 'Accept',
              active_friendships_path(
                active_friendship: {
                  user_id: request.user_id,
                  friend_id: current_user.id
                }
              ),
              method: 'post',
              class: 'btn-success p-1 rounded small no-link'
    end
    link
  end
end
