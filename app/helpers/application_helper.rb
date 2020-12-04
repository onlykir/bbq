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

  def declination_of_word(count, form, form_a, form_ov)
    return form_ov if (11..14).include?(count % 100)

    last_num = count % 10

    return form if last_num == 1
    return form_a if (2..4).include?(last_num)
    form_ov
  end

end
