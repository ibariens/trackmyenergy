class DataController < ApplicationController
  def index
    if params[:request] == 'initial_data'
      @response_data = ModelCombiner.create_initial_data(User.find(100))
    elsif params[:request] == 'recent_data'
      @response_data = EnergyLog.create_recent_data(User.find(100)).to_json
    else
      @response_data = "please set request parameter to inital data or update_data"
    end


    respond_to do |format|
      format.all { render :json => @response_data }
    end
  end
end
