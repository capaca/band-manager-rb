class Admin::BandsController < Admin::BaseController

  permissions :bands
  
  # GET /bands
  # GET /bands.xml
  def index
    configured_band = Configuration.instance.band
    if configured_band
      redirect_to admin_band_path(configured_band)
      return
    end
    @bands = Band.paginate :page => params[:page]
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])
    @posts = @band.paginate_posts(params[:page])
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    @band = Band.new
    @countries = Country.all
    @genres = Genre.all
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
    
    if @band.save
      flash[:notice] = get_message "band.save"
      redirect_to admin_bands_path
    else
      @countries = Country.all
      @genres = Genre.all
    
      render :action => "new"
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])
    
    begin
      @band.update_attributes!(params[:band])

      flash[:notice] = get_message "band.update"
      redirect_to edit_admin_band_path(@band)
      
    rescue ActiveRecord::RecordInvalid
      @countries = Country.all
      @genres = Genre.all
      
      render :action => "edit"
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(admin_bands_path) }
      format.xml  { head :ok }
    end
  end
  
  def destroy_picture
    @band = Band.find(params[:id])
    
    if(@band.picture)
      @band.picture.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to edit_admin_band_path(@band) }
      format.xml  { head :ok }
    end
  end
  
  def destroy_logo
    @band = Band.find(params[:id])
    
    if(@band.logo)
      @band.logo.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to edit_admin_band_path(@band) }
      format.xml  { head :ok }
    end
  end
  
  private 
  
  def object
    @band ||= Band.find(params[:id])
  end
  
end
