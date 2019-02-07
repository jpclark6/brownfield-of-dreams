class ConfirmationNotifierMailer < ApplicationMailer
  def confirm(user)
    @user = user
    confirm_code = SecureRandom.hex(15)
    binding.pry
    @user.update(confirmation: confirm_code)
    mail(to: @user.email, subject: 'Confirm Email')
  end
end
