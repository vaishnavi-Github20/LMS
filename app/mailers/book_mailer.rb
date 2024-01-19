class BookMailer < ApplicationMailer
  default from: 'vaishnaviganeshkar@gmail.com'
  def issue_confirmation(book, user)
    @book = book
    @user = user

    mail(to: @user.email, subject: 'Book Issued Successfully')
  end

end
