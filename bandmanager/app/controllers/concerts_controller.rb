class ConcertsController < ApplicationController
  # GET /concerts
  # GET /concerts.xml
  def index
    @concerts = Concert.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @concerts }
    end
  end

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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @concert }
    end
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
  end

  # POST /concerts
  # POST /concerts.xml
  def create
    @concert = Concert.new(params[:concert])

    respond_to do |format|
      if @concert.save
        flash[:notice] = 'Concert was successfully created.'
        format.html { redirect_to(@concert) }
        format.xml  { render :xml => @concert, :status => :created, :location => @concert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.xml
  def update
    @concert = Concert.find(params[:id])

    respond_to do |format|
      if @concert.update_attributes(params[:concert])
        flash[:notice] = 'Concert was successfully updated.'
        format.html { redirect_to(@concert) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.xml
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    respond_to do |format|
      format.html { redirect_to(concerts_url) }
      format.xml  { head :ok }
    end
  end
end
