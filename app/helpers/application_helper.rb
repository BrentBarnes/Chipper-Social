module ApplicationHelper

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    elsif user.avatar_url
      user.avatar_url
    else
      gravatar_image_url(user.email)
    end
  end
end
