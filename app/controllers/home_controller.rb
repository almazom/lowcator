class HomeController < ApplicationController
  layout "general"
  respond_to :html, :js

  def index
    respond_to do |format|
      format.html
      format.js do
        @links = Link.limit(20).offset(params[:offset].to_i) if !params[:offset].blank?
        render_tweets
      end
    end
  end
end
