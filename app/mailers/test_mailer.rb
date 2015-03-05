class TestMailer < ApplicationMailer

  def boring(user)
    @user = user
    mail(to: @user.email)
  end
end
