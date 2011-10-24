#class AnonymousUser < StandardError
#  # пользователь не найден
#end

module ApplicationHelper
  def show_current_user
    current_user.email
  end

  def fav_class_detection link_id
    if current_user
      !is_favorited?(link_id) ? 'unfavorited' : 'favorited'
    else
      ''
    end
  end


  def get_class_for_navigation current
    if controller.controller_name.to_s == current
      'active'
    else
      ''
    end
  end

  def is_favorited? link_id
    if current_user
      current_user.favorits.where(:link_id => link_id).exists?
    else
      false
    end
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
