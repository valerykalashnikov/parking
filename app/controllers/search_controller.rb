class SearchController < ApplicationController
  def index
    @results = Vehicle.search_by_licence_plate(params[:q]) || []
  end
end