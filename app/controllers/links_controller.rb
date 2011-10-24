class LinksController < ApplicationController
  layout 'scaffold'


  def show_custom_link
    raise 'no link_id in get vars' unless params[:id]
    #raise params.to_json
    @links = Link.find(params[:id])
    render_tweets
  end


  def index
    @links = current_user.links

    respond_to do |format|
      format.html
      format.js { render_tweets }
    end
  end

  def show
    @links = Link.find(params[:id])
    @comments = @links.comments


    respond_to do |format|
      format.html
      @link_extented = true
      format.js { render_tweets }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = current_user.links.build()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to :back, notice: 'Link was successfully created.' }
        format.json { render json: user_links_path(current_user), status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :ok }
    end
  end
end
