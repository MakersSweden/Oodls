module ApplicationHelper
  def display_status(status)
    status ? image('true.png') : image('false.png')
  end

  private
  def image(name)
    "/images/#{name}"
  end
end

