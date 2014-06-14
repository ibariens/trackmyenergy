class EnergyPrice < ActiveRecord::Base
  def self.expensive?(pattern_string)
    false
  end

  def self.get_last_24_hours
    EnergyPrice.where("timestamp > ? AND timestamp < ?", Time.now - 22.hour, Time.now+2.hours).map {|x| [x.timestamp, x.eur]}
  end
end




