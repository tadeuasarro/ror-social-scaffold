module UserHelper
  def new_friendship_request(user)
    link = capture {
      link_to user.name,
      friendship_requests_path(
        friendship_request:{
          user_id: current_user.id,
          friend_id: user.id
        }
      ),
      method: 'post'
    }
    link
  end

end
