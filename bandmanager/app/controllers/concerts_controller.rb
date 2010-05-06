class ConcertsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @band = Band.find(params[:band_id])
    @concerts = @band.paginate_concerts(params[:page])
  end
  
  # GET /concerts/1
  # GET /concerts/1.xml
  def show
    @concert = Concert.find(params[:id])
    @band = Band.find(params[:band_id])
  end

  # GET /concerts/new
  # GET /concerts/new.xml
  def new
    @concert = Concert.new
    @band = Band.find(params[:band_id])
    @countries = Country.all
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
    @band = Band.find(params[:band_id])
    @countries = Country.all
  end

  # POST /concerts
  # POST /concerts.xml
  def create
    @concert = Concert.new(params[:concert])
    @band = Band.find(params[:band_id])
    @concert.bands << @band

    if @concert.save
      flash[:notice] = 'Concert was successfully created.'
      redirect_to band_path(@band, :anchor => 'concerts')
    else
      @countries = Country.all
      render :action => "new"
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.xml
  def update
    @concert = Concert.find(params[:id])
    @band = Band.find(params[:band_id])
    if @concert.update_attributes(params[:concert])
      flash[:notice] = 'Concert was successfully updated.'
      redirect_to edit_band_concert_path(@band, @concert)
    else
      render :action => "edit"
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.xml
  def destroy
    @band = Band.find(params[:band_id])
    @concert = Concert.find(params[:id])
    @concert.destroy

    redirect_to band_path(@band, :anchor => 'concerts')
  end
end
