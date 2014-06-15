class Pattern < ActiveRecord::Base
  def self.define_action(status_message)
    status_array = status_message.split(' ')
    if status_array.include? 'Identified and Turned'
      {:action => {:message => status_message,
                   :pattern_id => status_array[2],
                   :appliance_name => Appliance.fetch_name(status_array[2]),
                   :device_choice => Appliance.get_device_list}}
    else status_array.include? 'Request identification'
        {:action => {:message => status_message,
                     :pattern_id => status_array[2],
                     :device_choice => Appliance.get_device_list}}
    end
  end
end
