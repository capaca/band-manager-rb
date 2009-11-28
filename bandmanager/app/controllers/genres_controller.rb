class GenresController < ApplicationController
  # GET /genres
  # GET /genres.xml
  def index
    @genres = Genre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genres }
    end
  end

  # GET /genres/new
  # GET /genres/new.xml
  def new
    @genre = Genre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @genre }
    end
  end

  # POST /genres
  # POST /genres.xml
  def create
    @genre = Genre.new(params[:genre])

    respond_to do |format|
      if @genre.save
        flash[:notice] = get_message "genre.save"
        format.html { redirect_to(genres_url) }
        format.xml  { render :xml => @genre, :status => :created, :location => @genre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @genre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.xml
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to(genres_url) }
      format.xml  { head :ok }
    end
  end
end
