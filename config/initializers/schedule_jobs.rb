# config/initializers/schedule_jobs.rb

# Schedule job to check for late returns (for example, daily)
LateReturnNotificationJob.set(wait_until: Time.now.tomorrow.beginning_of_day).perform_later
