class Pattern < ActiveRecord::Base
  def self.define_action(status_message)
    status_array = status_message.split(' ')
    if status_array.include? 'Pattern'
      {:action => {:message => status_message,
                   :pattern_id => status_array[2],
                   :device_choice => Appliance.get_device_list}}
    end
  end
end
