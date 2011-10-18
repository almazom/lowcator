class HomeController < ApplicationController
  layout "general"

  def index
    respond_to do |format|
      format.html
      format.js { render_tweets }
    end
  end
end
