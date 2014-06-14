class ModelCombiner
  def self.create_recent_data(user)
    result = {:response => {:user_id => user.id}}
    result[:response].merge! EnergyLog.create_recent_data(user)
    result[:response][:action_required] = false

    pattern_string = 'unknown'

    if UserStatus.for_user(user).is_changing? && UserStatus.for_user(user).action_required?(pattern_string)
      result[:response][:action_required] = true
      result[:response].merge! UserStatus.define_action
    end

  result
  end

  def self.create_initial_data(user)
    user_id = user.id
    user_savings = [["14/06/2014",5.02],["15/06/2014",3.02]]
    last_pricings = EnergyPrice.get_last_24_hours

    {:result => {:user_id => user_id,
                 :user_savings => user_savings,
                 :last_pricings => last_pricings
                }
    }
  end
end