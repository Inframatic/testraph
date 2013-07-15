class StemsController < ApplicationController
  # include ActionController::Live
  before_filter :authenticate_user!, except: [:index]
  before_filter :set_stem, only: [:show, :edit, :update, :destroy]

  def index
  	@stems = Stem.all
  end

  def show
  end

  def new
  	@track = Track.find( params[:track_id] )
  	@stem = @track.stems.build
  end

  def edit
  end

  def create
  	@track = Track.find( params[:track_id] )
    @stem = @track.stems.build(stem_params)

    if current_user == @track.user
      @stem.approved = true
    end

    respond_to do |format|
      if @stem.save
        format.html { redirect_to track_url(params[:track_id]), notice: "Stem created."}
      else
        format.html { render action: 'new'}
      end
    end
  end

  def update
  	respond_to do |format|
      if @stem.update(stem_params)
        format.html { redirect_to @stem, notice: 'Stem was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def approve
    @track = Track.find(params[:track_id])
    @stem = @track.stems.find(params[:stem_id])
    @stem.update_attributes(:approved => true)
    respond_to do |format|
      format.html {redirect_to track_url(params[:track_id])}
    end
  end


  def destroy
    @stem.destroy
    respond_to do |format|
      # format.html {redirect_to tracks_url}
      format.html {redirect_to track_url(params[:track_id])}
    end
  end

  private

  def set_stem
    @stem = Stem.find(params[:id])
  end

  def stem_params
    params[:stem][:user_id] = current_user.id
    params.require(:stem).permit(:audio, :title, :user_id, :approved)
  end
end

