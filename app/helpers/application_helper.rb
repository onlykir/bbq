module ApplicationHelper
  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end

  def user_avatar(user)
    # TODO: user real avatars
    'user.png'
  end

  def flash_class_name(name)
    case name
    when 'notice' then 'secondary'
    when 'alert'  then 'danger'
    else name
    end
  end
end
