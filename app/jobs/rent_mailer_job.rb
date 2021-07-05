class RentMailerJob < ApplicationJob
  queue_as :default

  def perform(rent)
    RentMailer.new_rent(rent).deliver
  end
end
