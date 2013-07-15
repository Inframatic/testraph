class CommentsController < ApplicationController
	include ActionController::Live
	before_filter :user_signed_in?
	before_filter :load_tracks

def show
	@comment = Comment.find(params[:id])
end

def new
	@comment = current_user.comments.new
end

def edit
	@comment = current_user.comments.find(params[:id])
end

def create
  @comment = current_user.comments.new(comment_params)
  respond_to do |format|
    if @comment.save
      format.html { redirect_to @track, notice: "Comment created."}
    else
      format.html { redirect_to @track, alert: @comment.errors.full_messages }
    end
  end
end

def update
end

def destroy
  @comment = current_user.comments.find(params[:id])
  @comment.destroy
  respond_to do |format|
    format.html {redirect_to @track}
  end
end

private

def load_tracks
@track = Track.find(params[:track_id])
end

def set_comment
  @comment = Comment.find(params[:id])
end

def comment_params
	params[:comment][:track_id] = params[:track_id]
  params.require(:comment).permit(:text, :user_id, :track_id)
end

end
