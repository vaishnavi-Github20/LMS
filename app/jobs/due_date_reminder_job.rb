# app/jobs/due_date_reminder_job.rb

class DueDateReminderJob < ApplicationJob
   queue_as :default

  def perform(book, user)
    BookMailer.due_notification(book, user).deliver_now
  end
end
