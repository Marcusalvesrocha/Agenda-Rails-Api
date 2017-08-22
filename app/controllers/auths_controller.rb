class AuthsController < ApplicationController
	def create
		puts ">>>>>>>>>>>#{params[:name]}"

		payload = {name: params[:name], exp: Time.now.to_i + 30}
		hmac_secret = 'my$ecretK3y'

		token = JWT.encode payload, hmac_secret, 'HS256'	



		render json: {token: token}
	end
end
