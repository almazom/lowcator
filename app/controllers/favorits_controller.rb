class FavoritsController < ApplicationController
  layout 'general'


  def index
    #@links = current_user.links.joins(:favorits).all

    #TODO: refactor me
    #links_id = Favorit.where(:user_id => current_user.id).select(:link_id).all.map(&:link_id)
    #@links = Link.find(links_id)


    @links = Link.search '', :with => {:favorits_user_id => current_user.id}

    respond_to do |format|
      format.html
      format.js { render :partial => "/tweet" }
    end
  end

  def destroy
    @favorit = Favorit.find(params[:id])
    @favorit.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
      format.js { render js: "window.switch_to_unforited('#{t(:favorited_sucessfully)}', #{@favorit.link_id})", status: :created, location: @favorit }
    end
  end

  def create
    @favorit = Favorit.new(params[:favorit])

    respond_to do |format|
      if @favorit.save
        format.html { redirect_to @favorit, notice: 'Favorit was successfully created.' }
        format.json { render json: @favorit, status: :created, location: @favorit }
        format.js { render js: "window.switch_to_unforited('#{t(:favorited_sucessfully)}', #{params[:favorit][:link_id]})", status: :created, location: @favorit }
      else
        format.html { render action: "new" }
        format.json { render json: @favorit.errors, status: :unprocessable_entity }
      end
    end
  end

  ## GET /favorits/1
  ## GET /favorits/1.json
  #def show
  #  @favorit = Favorit.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @favorit }
  #  end
  #end
  #
  ## GET /favorits/new
  ## GET /favorits/new.json
  #def new
  #  @favorit = Favorit.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @favorit }
  #  end
  #end
  #
  ## GET /favorits/1/edit
  #def edit
  #  @favorit = Favorit.find(params[:id])
  #end
  #
  ## POST /favorits
  ## POST /favorits.json

  #
  ## PUT /favorits/1
  ## PUT /favorits/1.json
  #def update
  #  @favorit = Favorit.find(params[:id])
  #
  #  respond_to do |format|
  #    if @favorit.update_attributes(params[:favorit])
  #      format.html { redirect_to @favorit, notice: 'Favorit was successfully updated.' }
  #      format.json { head :ok }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @favorit.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #

end
