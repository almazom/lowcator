class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter lambda { @links ||= Link.limit(LIMIT) }

  def render_tweets
    render :partial => "/tweet", :layout => false
  end

end
