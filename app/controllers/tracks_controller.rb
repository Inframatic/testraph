class TracksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_track, only: [:show, :edit, :update, :delete]

  def index
  	@tracks = Track.all
  end

  def show
  	@track = Track.find(params[:id])
  end

  def new
  	@track = Track.new
  end

  def edit

  end

  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: "Track created."}
      else
        format.html { render action: 'new'}
      end
    end
  end

  def update
  	   respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def delete
@track.destroy
respond_to do |format|
  format.html {redirect_to tracks_url}
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:title, :description)
  end
end

end
