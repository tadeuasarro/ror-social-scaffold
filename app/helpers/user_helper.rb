module UserHelper
  def new_friendship_request(user)
    link = ''
    unless user.id == current_user.id
      link = if get_friendship_request(user)
               content_tag(
                 :span,
                 'Request sent',
                 class: 'btn-warning p-1 rounded small no-link'
               )
             elsif get_active_friendship(user)
               content_tag(
                 :span,
                 'Befriended already',
                 class: 'btn-success p-1 rounded small no-link'
               )
             else
               capture do
                 link_to 'Add friend',
                         friendship_requests_path(
                           friendship_request: {
                             user_id: current_user.id,
                             friend_id: user.id
                           }
                         ),
                         method: 'post',
                         class: 'btn-dark p-1 rounded small no-link'
               end
             end
    end
    link
  end

  def get_friendship_request(user)
    result = FriendshipRequest.where(user_id: current_user.id, friend_id: user.id).first
    result
  end

  def get_active_friendship(user)
    result = ActiveFriendship.where(user_id: current_user.id, friend_id: user.id).first
    result
  end
end
