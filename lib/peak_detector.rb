class PeakDetector
  def self.update_status(user)
    status = EnergyLog.current_trend
    entry = UserStatus.where(:user_id => user.id).first_or_create
    entry.status = status
    entry.updated_at = Time.now
    entry.save
  end
end