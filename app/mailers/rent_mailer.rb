class RentMailer < ApplicationMailer
  def new_rent(rent)
    I18n.locale = rent.user.locale
    @rent = rent
    mail(to: @rent.user.email, subject: "#{I18n.t 'books.new_rent_created' }!")
  end

  def end_of_rent(rent)
    I18n.locale = rent.user.locale
    @rent = rent
    mail(to: @rent.user.email, subject: "#{I18n.t 'books.book_rental_expired' }!")
  end
end
