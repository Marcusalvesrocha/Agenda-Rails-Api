class PhonesController < ApplicationController
	before_action :set_contact, only: [:show, :update, :create, :destroy]

	# POST /contacts/1/address
  def create
		@contact.phones << Phone.new(phone_params)

		if @contact.save
			render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
		else
			render json: @contact.errors, status: :unprocessable_entity
		end
	end

	# PATCH /contacts/1/phone
  def update
  	
  	if Phone.find(phone_params[:id]).update(phone_params)
			render json: @contact.phones
		else
			render json: @contact.errors, status: :unprocessable_entity
		end
	end

	# DELETE /contacts/1/address
  def destroy
  	Phone.find(phone_params[:id]).destroy
  end

	# GET /contact/1/phones/
  def show
    render json: @contact.phones
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    def phone_params
    	ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

end
