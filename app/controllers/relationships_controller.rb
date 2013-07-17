class RelationshipsController < ApplicationController
	include ActionController::Live

 def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to @user
  end



  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end

private

def relationship_params
  params.require(:relationship).permit(:followed_id, :follower_id)
end

