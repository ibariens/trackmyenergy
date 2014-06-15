class EnergyMix < ActiveRecord::Base
  self.table_name="kpi_view"


  def self.create_recent_data
    actual_usage = self.first

    last_usage = actual_usage.real_consumption
    wind = (actual_usage.wind_share*100).round(2)
    sun = (actual_usage.solar_share*100).round(2)
    fire = 100 - wind - sun
    c02_saved = actual_usage.co2_saved
    eur_saved = actual_usage.eur_saved


    {:current_usage => {:energy => last_usage,
                        :wind => wind,
                        :sun => sun,
                        :fire => fire,
                        :co_two_saved => c02_saved,
                        :eur_saved => eur_saved}}
  end
end
