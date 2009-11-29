class BandsController < ApplicationController
  # GET /bands
  # GET /bands.xml
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bands }
    end
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    @band = Band.new
    @countries = Country.all
    @genres = Genre.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])

    @countries = Country.all
    @genres = Genre.all
  end

  # POST /bands
  # POST /bands.xml
  def create
    @band = Band.new(params[:band])
    @band.picture = Attachment.new(params[:picture])
    
    respond_to do |format|
      if @band.save
        flash[:notice] = get_message "band.save"
        format.html { redirect_to(@band) }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        @countries = Country.all
        @genres = Genre.all
      
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])

    respond_to do |format|
      if @band.update_attributes(params[:band]) && 
         @band.picture.update_attributes(params[:picture])
         
        flash[:notice] = get_message "band.update"
        format.html { redirect_to(@band) }
        format.xml  { head :ok }
      else
        @countries = Country.all
        @genres = Genre.all
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(bands_url) }
      format.xml  { head :ok }
    end
  end
end
