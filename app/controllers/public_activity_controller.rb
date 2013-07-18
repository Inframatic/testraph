class PublicActivityController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")

  	render '_index'
  end
end
