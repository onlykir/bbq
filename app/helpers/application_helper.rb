module ApplicationHelper
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

  def fa_icon(icon_class)
     content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
