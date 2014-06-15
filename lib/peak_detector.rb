class PeakDetector
  def self.update_status(user)
    actual_status       = PatternView.current_action || 'unknown'
    stored_status_entry = UserStatus.where(:user_id => user.id).first_or_create(:status => 'Idle')

    if actual_status == stored_status_entry.status
      return

    elsif stored_status_entry.status.include? 'Idle' || (stored_status_entry.status.include? 'Action')
      stored_status_entry.status = actual_status

    else
      raise("#{stored_status_entry.status} should not be possible")
    end

    stored_status_entry.updated_at = Time.now
    stored_status_entry.save
  end
end


# Action: Pattern x Identified and Turned ON
# Action: Pattern x Identified and Turned OFF

# Action: Pattern x Request identification and Turned OFF
# Action: Pattern x Request identification and Turned ON

# Idle