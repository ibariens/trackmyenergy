class Pattern < ActiveRecord::Base
  self.table_name="energy_log_intervals_view"

  def self.current_trend(length=DEFAULT_PATTERN_LENGTH, margin=10)
    pattern = self.first.values
    max_value = pattern.max
    min_value = pattern.min
    #puts "#{max_value} and #{min_value}"

    if (max_value - min_value) > margin
      if pattern.index(max_value) > pattern.index(min_value)
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