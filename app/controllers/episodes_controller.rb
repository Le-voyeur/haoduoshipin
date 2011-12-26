class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
    respond_to do |format|
      format.html 
      format.rss
    end
  end

  def show
    @episode = Episode.find(params[:id])
    @comment = Comment.new(:episode => @episode, :user => current_user)
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(params[:episode])
    if @episode.save
      redirect_to @episode, :notice => "Successfully created episode."
    else
      render :new
    end
  end

  def edit
    @episode = Episode.find(params[:id]) #in auth-love, I do not need this FIXME, but when I check railscasts 192-cancan, I found this in Rbates' controller, I am feeling good now
  end

  def update
    @episode = Episode.find(params[:id]) # in auth-love, I do not need this FIXME
    if @episode.update_attributes(params[:episode])
      redirect_to @episode, :notice => "Successfully updated episode."
    else
      render :edit
    end
  end
end
