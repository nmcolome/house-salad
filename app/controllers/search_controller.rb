class SearchController < ApplicationController
  def index
    @members = Member.get_house_members_from(params[:state])
    # flash[:success] = "#{@members.count} Result"
  end
end