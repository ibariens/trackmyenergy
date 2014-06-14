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
    if self.status == 'increasing'
      if Pattern.known?(pattern_string) && ElectricityPrice.expensive?(pattern_string)
        return true
      elsif !Pattern.known?(pattern_string)
        return true
      end
    else
      return false
    end
  end

  def define_action
    {:action => {:message => 'heeh', :pattern_id => 'fsdfsd', :device_id => 'sdfsdfds'}}
  end

  def reset
    self.status = 'nothing'
    self.updated_at = Time.now
    self.save
  end
end
