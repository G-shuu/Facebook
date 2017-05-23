module ApplicationHelper
  def profile_img(user)
    unless user.provider.blank?
      image_url = user.image_url
    else
      image_url = 'no_img.png'
    end
    image_tag(img_url, alt: user.name)
  end
end
