module ApplicationHelper
  def status_image(status)
    status ? image('true.svg') : image('false.svg')
  end

  private
  def image(name)
    "/images/#{name}"
  end
end

