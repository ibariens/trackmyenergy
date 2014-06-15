class EnergyLog < ActiveRecord::Base
  def self.get_last_entries(length)
    order(timestamp: :desc).limit(length)
  end

  def self.get_last
    order(timestamp: :desc).limit(1).first
  end
end