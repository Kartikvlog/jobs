class ContactMailer < ApplicationMailer
    default from: "kartikpatidar74217@gmail.com"
  
    CONTACT_EMAIL = "kartikpatidar117@gmail.com"
  
    def submission(message)
      @message = message
      mail(to: CONTACT_EMAIL, subject: 'New contact page submission')
    end
  end
