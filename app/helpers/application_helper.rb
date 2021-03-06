module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name, :size => "50x50", :class => "profile_avatar") if user.avatar.present?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, :size => "50x50", :class => "profile_avatar")
  end
end
