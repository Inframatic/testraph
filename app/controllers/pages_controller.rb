class PagesController < ApplicationController
  def home
  	if user_signed_in?
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User").page(params[:page]).per_page(20)
	  end
  end
end
