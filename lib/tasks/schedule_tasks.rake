# lib/tasks/schedule_tasks.rake

task :schedule_late_return_notification_job => :environment do
  LateReturnNotificationJob.set(wait_until: Time.now.tomorrow.beginning_of_day).perform_later
end
