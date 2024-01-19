# app/jobs/late_return_notification_job.rb

class LateReturnNotificationJob < ApplicationJob
  queue_as :default

  def perform
    overdue_books = BookIssue.overdue_books # Implement a method to fetch overdue books
    overdue_books.each do |issue|
      BookMailer.late_return_notification(issue.book, issue.user).deliver_now
    end
  end
end
