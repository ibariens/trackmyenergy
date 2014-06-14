class DataController < ApplicationController
  def index
    @response_data = EnergyLog.create_recent_data(User.find(100)).to_json

    respond_to do |format|
      format.all { render :json => @response_data }
    end
  end
end
