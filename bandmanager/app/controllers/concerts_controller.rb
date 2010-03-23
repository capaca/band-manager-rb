class ConcertsController < ApplicationController

  # GET /concerts/1
  # GET /concerts/1.xml
  def show
    @concert = Concert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concert }
    end
  end

  # GET /concerts/new
  # GET /concerts/new.xml
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
  end

  # POST /concerts
  # POST /concerts.xml
  def create
    @concert = Concert.new(params[:concert])

    if @concert.save
      flash[:notice] = 'Concert was successfully created.'
      redirect_to(@concert)
    else
      render :action => "new"
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.xml
  def update
    @concert = Concert.find(params[:id])

    if @concert.update_attributes(params[:concert])
      flash[:notice] = 'Concert was successfully updated.'
      redirect_to(@concert)
    else
      render :action => "edit"
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.xml
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    redirect_to(concerts_url)
  end
end
