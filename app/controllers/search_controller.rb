class SearchController < ApplicationController
  def index
    @members = Member.get_house_members_from(params[:state])
    flash.now[:alert] = "#{@members.count} Result"
  end
end