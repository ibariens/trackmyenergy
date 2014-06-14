class Pattern < ActiveRecord::Base
  def self.current_trend(length=DEFAULT_PATTERN_LENGTH, margin=10)

    usages = EnergyLog.get_last(length)
    if (usages.max.consumption - usages.min.consumption) > margin
      if usages.max.timestamp > usages.min.timestamp
        return 'increasing'
      else
        return 'decreasing'
      end
    else
      return 'nothing'
    end
  end

  def self.energy_moving_average(n=DEFAULT_PATTERN_LENGTH)
    EnergyLog.order(timestamp: :desc).limit(n).average(:consumption)
  end

  def self.known?(pattern_string)
    Pattern.where("pattern = ?", pattern_string).count == 1
  end
end