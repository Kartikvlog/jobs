class ContactsController < ApplicationController
    def index
        @contacts = Contact.all
        render json: @contacts 
     end
    
      # def create
      #   # we'll create our contact job here
      #   ContactJob.perform_later params.permit(:message)[:message]
      # end
      def create
        @contact = Contact.new(contact_params) 
        if @contact.save
          ContactJob.perform_now params.permit(:message)[:message]
          render json: @contact
        else
          render error: {error: "unable to create"}
        end
      end
    
      private
      def contact_params
        params.require(:contact).permit(:title, :text, :message)
     end
    
end
