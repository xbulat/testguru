module BadgesHelper
  def badge_image(badge)
    image_path(badge.image.present? ? badge.image : 'default_badge.png')
  end
end
