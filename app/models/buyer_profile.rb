class BuyerProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  # after_create :send_welcome_email

  # validates :size, :style, presence: true

  private

# ------ Welcome email method
  # def send_welcome_email
  #   UserMailer.welcome_buyer(user).deliver_now
  # end

end
