module UserHelper
  def new_friendship(user)
    unless user.id == current_user.id
      friendship = get_friendship(user)
      link = if friendship
               if friendship.confirmed
                 content_tag(:small, 'Befriended already!', class: 'p-1 rounded btn-success')
               elsif current_user.id == friendship.user_id
                 content_tag(:small, 'Request sent!', class: 'p-1 rounded btn-warning')
               end
             else
               capture do
                 link_to 'Add friend',
                         friendships_path(
                           friendship: {
                             user_id: current_user,
                             friend_id: user,
                             confirmed: false
                           }
                         ),
                         method: 'post',
                         class: 'p-1 rounded btn-dark small no-link'
               end
             end
    end
    link
  end

  def get_friendship(user)
    result = Friendship.find_by(user_id: current_user.id, friend_id: user.id)
    result = Friendship.find_by(user_id: user.id, friend_id: current_user.id) if result.nil?
    result
  end
end
