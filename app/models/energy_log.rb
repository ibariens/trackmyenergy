class EnergyLog < ActiveRecord::Base
  def self.create_recent_data(user)
    last_usage = order(timestamp: :desc).first
    wind = 39.2
    sun = 22.0
    fire = 100 - wind - sun


    json_hash = {:response => {:user_id => user.id,
                               :action_required => true,
                               :current_usage => {:energy => last_usage.consumption,
                                                  :wind => wind,
                                                  :sun => sun,
                                                  :fire => fire}},
                               :pattern_id => 1232342
                }
    json_hash
  end

  def self.current_trend(margin=10)
    usages = order(timestamp: :desc).limit(2)
    last_usage = usages[0].consumption
    previous_usage = usages[1].consumption

    increase_decrease = last_usage - previous_usage

    if increase_decrease > (last_usage * margin / 100)
      return 'increasing'
    elsif
      increase_decrease < (last_usage * margin / 100 * -1)
      return 'decreasing'
    else
      return 'nothing'
    end
  end

  def self.energy_moving_average(n=11)
    EnergyLog.order(timestamp: :desc).limit(n).average(:consumption)
  end
end