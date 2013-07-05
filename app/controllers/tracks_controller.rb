class TracksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def index
  	@tracks = Track.all
  end

  def show
  	@track = Track.find(params[:id])
  end

  def new
  	@track = current_user.tracks.new
  end

  def edit
    @track = current_user.tracks.find(params[:id])

  end

  def create
    # @track = Track.new(track_params)

    @track = current_user.tracks.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: "Track created."}
      else
        format.html { render action: 'new'}
      end
    end
  end

  def update
    @track = current_user.tracks.find(params[:id])

  	respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @track = current_user.tracks.find(params[:id])
    @track.destroy
    respond_to do |format|
      format.html {redirect_to tracks_url}
    end
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:title, :description)
  end
end
