class ContactMailer < ApplicationMailer
  #default from: "noreply@greenagrobiotech.com"
 
  default to: "risedigitech@gmail.com"

  def new_message(message)
    @name = message.name
    @email =  message.email
    @subject = message.subject
    @msg = message.message

    mail( :email => @email, :name => @name, :subject => @subject, :message    =>  @msg )

  end

end
