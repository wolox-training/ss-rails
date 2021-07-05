class RentMailer < ApplicationMailer
  def new_rent(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: 'New rent created')
  end
end
