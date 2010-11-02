class Admin::PostsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @band = Band.find(params[:band_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @band = @post.band
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @band = Band.find(params[:band_id])
    @post.band = @band

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to admin_band_path(@band, :anchor => 'posts')
    else
      render :action => "new"
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @band = @post.band
    
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to admin_band_path(@band)
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    band = @post.band
    @post.destroy
    
    redirect_to(admin_band_path(band, :anchor => 'posts'))
  end
end
