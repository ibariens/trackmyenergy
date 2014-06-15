class Pattern < ActiveRecord::Base
  def define_action
    {:action => {:message => 'unknown_device', :pattern_id => 1243432423, :device_choice => [['Vacuum Clear', 234],['FAN', 3423423]]}}
  end

  def identify_action(pattern_string)

  end
end