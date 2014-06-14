class EnergyLog < ActiveRecord::Base
  def self.create_recent_data(user)
    last_usage = get_last.consumption
    wind = 39.2
    sun = 22.0
    fire = 100 - wind - sun


    {:current_usage => {:energy => last_usage,
                       :wind => wind,
                       :sun => sun,
                       :fire => fire}}
  end

  def self.get_last_entries(length)
    order(timestamp: :desc).limit(length)
  end

  def self.get_last
    order(timestamp: :desc).limit(1).first
  end
end