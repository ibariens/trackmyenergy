class Appliance < ActiveRecord::Base
  def self.get_device_list
    return [['Vacuum Clear', 234],['FAN', 3423423]]
  end
end

