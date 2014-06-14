class UserStatus < ActiveRecord::Base
  def self.for_user(user)
    user_status = UserStatus.where(:user_id => user.id).first
  end

  def self.action_required?(user)
    self.for_user(user).status
  end
end
