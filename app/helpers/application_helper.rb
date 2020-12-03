module ApplicationHelper
  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end

  def user_avatar(user)
    # TODO: user real avatars
    'user.png'
  end
end
