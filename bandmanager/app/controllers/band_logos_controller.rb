class BandLogosController < ApplicationController
  def create
    @band = Band.find(params[:band_id])
  
    @band_logo = BandLogo.new(params[:band_logo])
    @band_logo.band = @band
    
    @genres = Genre.all
    
    respond_to do |format|
      if @band_logo.save
        flash[:notice] = get_message "band_logo.create"
        format.html { render :template=> 'bands/edit.html.erb' }
        format.xml  { render :xml => @band_logo, :status => :updated, :location => @band_logo }
      else
        format.html { render :template=> 'bands/edit.html.erb' }
        format.xml  { render :xml => @band_logo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

end
