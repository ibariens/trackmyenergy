class UserStatus < ActiveRecord::Base
  def self.for_user(user)
    UserStatus.where(:user_id => user.id).first
  end
end
