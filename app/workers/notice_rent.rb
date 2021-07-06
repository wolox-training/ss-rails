require 'sidekiq-scheduler'

class NoticeRent
  include Sidekiq::Worker

  def perform
    rents = Rent.where(end_of_rent: Time.zone.today)
    rents.each do |rent|
      RentMailer.end_of_rent(rent).deliver
    end
  end
end
