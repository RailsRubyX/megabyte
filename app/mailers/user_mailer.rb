class UserMailer < ApplicationMailer
	def welcome_email(name, email)
    @user = name
    @email = email
    byebug
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end

  def msg_email(name, surname, email, phone, msg)
    @user = name + " " + surname
    @email = email
    @phone = phone
    @msg = msg
    @mailto = "bondarenko.s@elfa.ua"
    mail(to: @mailto, subject: 'Новая заявка на работу')
  end
end
