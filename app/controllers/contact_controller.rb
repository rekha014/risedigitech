class ContactController < ApplicationController


def new
    @message = Contact.new
  end

  def create_mail
    @message = Contact.new(message_params)
    
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def message_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end


	
end
