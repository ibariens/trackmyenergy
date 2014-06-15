class EnergyMix < ActiveRecord::Base
  self.table_name="kpi_view"


  def self.create_recent_data
    actual_usage = self.first

    last_usage = actual_usage.real_consumption
    wind = (actual_usage.wind_share*100)
    sun = (actual_usage.solar_share*100)
    fire = (100 - wind - sun)
    c02_saved = actual_usage.co2_saved
    eur_saved = actual_usage.eur_saved


    {:current_usage => {:energy => last_usage.round(2),
                        :wind => wind.round(2),
                        :sun => sun.round(2),
                        :fire => fire.round(2),
                        :co_two_saved => c02_saved.round(2),
                        :eur_saved => eur_saved.round(2)}}
  end
end
