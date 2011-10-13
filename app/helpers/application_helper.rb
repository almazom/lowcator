module ApplicationHelper
  def show_current_user
    current_user.email
  end

  def get_class_for_navigation current
    if controller.controller_name.to_s == current
      'active'
    else
      ''
    end
  end

  def is_favorited? link_id
    Link.find(link_id).favorits.where(:user_id => current_user.id).exists?
  end

  def show_domain_only url
    url.split('/')[2]
  end

  def show_favicon url
    if show_domain_only(url)
      image_tag ('http://'+show_domain_only(url).to_s+'/favicon.ico')
    else
      ''
    end

  end
end
