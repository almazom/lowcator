class FavoritsController < ApplicationController
  # GET /favorits
  # GET /favorits.json
  def index
    @favorits = Favorit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorits }
    end
  end

  # GET /favorits/1
  # GET /favorits/1.json
  def show
    @favorit = Favorit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorit }
    end
  end

  # GET /favorits/new
  # GET /favorits/new.json
  def new
    @favorit = Favorit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorit }
    end
  end

  # GET /favorits/1/edit
  def edit
    @favorit = Favorit.find(params[:id])
  end

  # POST /favorits
  # POST /favorits.json
  def create
    @favorit = Favorit.new(params[:favorit])

    respond_to do |format|
      if @favorit.save
        format.html { redirect_to @favorit, notice: 'Favorit was successfully created.' }
        format.json { render json: @favorit, status: :created, location: @favorit }
        format.js { render js: "alert('Favorited sucessfully!')", status: :created, location: @favorit }
      else
        format.html { render action: "new" }
        format.json { render json: @favorit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favorits/1
  # PUT /favorits/1.json
  def update
    @favorit = Favorit.find(params[:id])

    respond_to do |format|
      if @favorit.update_attributes(params[:favorit])
        format.html { redirect_to @favorit, notice: 'Favorit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorits/1
  # DELETE /favorits/1.json
  def destroy
    @favorit = Favorit.find(params[:id])
    @favorit.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end
end
