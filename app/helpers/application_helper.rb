module ApplicationHelper
  def default_img(image)
    image.presence || 'default.png'
  end

  # def sales?
  #   self.departments.map(&:name).include?("営業") 
  # end

  # def developer?
  #   self.departments.map(&:name).include?("開発")
  # end
end
