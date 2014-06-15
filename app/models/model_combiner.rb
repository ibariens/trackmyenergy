class ModelCombiner
  def self.create_recent_data(user)
    result = {:response => {:user_id => user.id}}
    result[:response].merge! EnergyMix.create_recent_data
    result[:response][:action_required] = false

    if UserStatus.for_user(user).status && (UserStatus.for_user(user).status.include? 'Pattern')
      result[:response][:action_required] = true
      result[:response].merge! Pattern.define_action(UserStatus.for_user(user).status)
    elsif UserStatus.for_user(user).status && (UserStatus.for_user(user).status.include? 'Vacuum cleaner detected')
      result[:response][:action_required] = false
      result[:response].merge! Pattern.define_action(UserStatus.for_user(user).status)
    end



  result
  end

  def self.create_initial_data(user)
    user_id = user.id
    user_savings = EnergyMix.create_past_savings
    last_pricings = EnergyPrice.get_last_24_hours

    {:result => {:user_id => user_id,
                 :user_savings => user_savings,
                 :last_pricings => last_pricings
                }
    }
  end
end