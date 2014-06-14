class DataController < ApplicationController
  def index
    @response_data = EnergyLog.create_recent_data.to_json

    respond_to do |format|
      format.json { render :json => @response_data }
    end
  end
end
