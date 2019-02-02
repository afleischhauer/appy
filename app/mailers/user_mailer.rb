class UserMailer < ApplicationMailer
  default from: "alexander.fleischhauer@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: "alexander.fleischhauer@gmail.com",
           subject: "New Contact from #{name}")
  end

  def order_placed(user, product)
     @user = user
     @product = product
     mail(to: user.email,
       from: "alexander.fleischhauer@gmail.com",
       subject: "Thank you for your money!")
   end

end
