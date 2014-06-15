class ModelCombiner
  def self.create_recent_data(user)
    result = {:response => {:user_id => user.id}}
    result[:response].merge! EnergyLog.create_recent_data(user)
    result[:response][:action_required] = false

    if UserStatus.for_user(user).status && (UserStatus.for_user(user).status.include? 'Pattern')
      result[:response][:action_required] = true
      result[:response].merge! Pattern.define_action(UserStatus.for_user(user).status)
    end

  result
  end

  def self.create_initial_data(user)
    user_id = user.id
    user_savings = [["4/06/2014",5.02],
                    ["5/06/2014",5.02],
                    ["6/06/2014",5.02],
                    ["7/06/2014",5.02],
                    ["8/06/2014",5.02],
                    ["9/06/2014",5.02],
                    ["10/06/2014",5.02],
                    ["11/06/2014",5.02],
                    ["12/06/2014",5.02],
                    ["13/06/2014",5.02],
                    ["14/06/2014",5.02],
                    ["15/06/2014",3.02]]
    last_pricings = EnergyPrice.get_last_24_hours

    {:result => {:user_id => user_id,
                 :user_savings => user_savings,
                 :last_pricings => last_pricings
                }
    }
  end
end