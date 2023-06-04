module ApplicationHelper
  def default_img(image)
    image.presence || 'default.png'
  end
end
