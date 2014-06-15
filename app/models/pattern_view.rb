class PatternView < ActiveRecord::Base
  self.table_name="energy_log_intervals_view"

  def self.current_action
    pattern_view = self.where("pattern = 1").first
    if pattern_view && pattern_view.pattern == 1
      pattern_id = pattern_view.change.round(-1).to_s
      known_pattern = Pattern.where("pattern_id = ?", pattern_id).first
      event_type = pattern_view.event_type_happened

      if known_pattern
        result = "Action: Pattern #{pattern_id} Identified and Turned #{event_type}"
      else
        result = "Action: Pattern #{pattern_id} Request identification and Turned #{event_type}"
      end
    else
      result = 'Idle'
    end

    if pattern_view && (pattern_view.pattern == 1) && (pattern_view.change.round(-1) > 600)
      result = 'Vacuum cleaner detected'
    end

  result
  end
end




# Action: Pattern x Identified and Turned ON
# Action: Pattern x Identified and Turned OFF

# Action: Pattern x Request identification and Turned OFF
# Action: Pattern x Request identification and Turned ON

# Idle