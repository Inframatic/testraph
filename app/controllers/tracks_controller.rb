class TracksController < ApplicationController
  include ActionController::Live
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_track, only: [:show, :edit, :update, :destroy, :queue]
  before_filter :ensure_current_user_is_owner, only: :queue

  def index
    @tracks = Track.where(:is_private => false).order('created_at desc')
  end

  # Public View
  def show
    @approved_stems = @track.stems.where(:approved => true).order('created_at desc')
    @comment = Comment.new
    @comments = @track.comments.order("created_at desc")
  end

  # Private queue
  def queue 
    @disapproved_stems = @track.stems.where(:approved => false).order('created_at desc')

  end

  def new
  	@track = current_user.tracks.new
    @track.stems.build
  end

  def edit
    @track = current_user.tracks.find(params[:id])

  end

  def create
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

  def ensure_current_user_is_owner
    if current_user != @track.user
      redirect_to tracks_url, :alert => 'Fuck off.'
    end
  end

  def track_params
    # params[:track][:stems_attributes]['0'][:user_id] = current_user.id
    # params[:track][:stems_attributes]['0'][:approved] = true
    params.require(:track).permit(:title, :description, :bpm, :is_private, :stems_attributes => [:audio, :title, :user_id, :approved], :collabs_attributes =>[:email, :id, :_destroy])
  end
end
