class UserStatus < ActiveRecord::Base
  def self.for_user(user)
    UserStatus.where(:user_id => user.id).first
  end

  def is_changing?
    status = self.status
    if self.updated_at < Time.now - DEFAULT_RESET_DELAY
      self.reset
      return false
    elsif status == 'increasing' || status == 'decreasing'
      return true
    else
      return false
    end
  end

  def action_required?(pattern_string)
   # if self.status == 'increasing'
   #   if Pattern.known?(pattern_string) && ElectricityPrice.expensive?(pattern_string)
   #     return true
   #   elsif !Pattern.known?(pattern_string)
   #     return true
   #   end
   # else
   #   return false
   # end
    true
  end

  def define_action
    {:action => {:message => 'unknown_device', :pattern_id => 1243432423, :device_choice => [['Vacuum Clear', 234],['FAN', 3423423]]}}
  end

  def reset
    self.status = 'nothing'
    self.updated_at = Time.now
    self.save
  end
end
