class EnergyMix < ActiveRecord::Base
  self.table_name="kpi_view"


  def self.create_recent_data
    actual_usage = self.first

    last_usage = EnergyLog.get_last
    wind       = (actual_usage.wind_share*100)
    sun        = (actual_usage.solar_share*100)
    fire       = (100 - wind - sun)
    c02_saved  = EnergyMix.sum(:co2_saved)
    eur_saved  = EnergyMix.sum(:eur_saved)


    {:current_usage => {:energy => last_usage,
                        :wind => wind.round(2),
                        :sun => sun.round(2),
                        :fire => fire.round(2),
                        :co_two_saved => c02_saved.round(2),
                        :eur_saved => eur_saved.round(2)}}
  end

  def self.create_past_savings
    result_array = Array.new
    self.all.each do |x|
      result_array << [x.timestamp.strftime("%d/%m/%Y-%H:%M"), x.eur_saved.round(2)]
    end
    result_array
  end
end
