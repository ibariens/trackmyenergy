require 'peak_detector'
ActiveRecord::Base.logger.level = 1


PD_THREAD = Thread.new do
  while true
    PeakDetector.update_status(User.find(100))
    sleep 5
  end
end