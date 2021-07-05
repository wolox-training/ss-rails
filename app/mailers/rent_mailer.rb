class RentMailer < ApplicationMailer
  def new_rent(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: 'New rent created')
  end

  def end_of_rent(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: 'End of rent notice!')
  end
end
