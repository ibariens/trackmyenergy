class PeakDetector
  def self.add_pattern

  end

  def self.update_status(user)
    status = PatternView.current_trend
    entry = UserStatus.where(:user_id => user.id).first_or_create
    entry.status = status
    entry.updated_at = Time.now
    entry.save
  end
end