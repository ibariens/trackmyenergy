class EnergyLog < ActiveRecord::Base
  def self.create_recent_data
    last_usage = order(timestamp: :desc).first
    wind = 39.2
    sun = 22.0
    fire = 100 - wind - sun

    json_hash = {:response => {:user_id => 100, :action_required => false, :current_usage => {:energy => last_usage.consumption, :wind => wind, :sun => sun, :fire => fire}}}
    json_hash
  end
end