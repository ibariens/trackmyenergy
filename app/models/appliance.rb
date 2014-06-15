class Appliance < ActiveRecord::Base
  def self.get_device_list
    return [['Vacuum Clear', 234],['FAN', 3423423]]
  end

  def self.fetch_name(id)
    name = 'unknown'
    pattern = Pattern.where("pattern_id = ?", id.to_s).first
    if pattern
      appliance = Appliance.find(pattern.appliance_id)
      name = appliance.name if appliance
    end
    name
  end
end

