require 'json'

class VendorsController < ApplicationController
  before_action :authenticate_vendor!

  def show
  end

  def confirm_attributes
		consumer_key = 'jfVdueylcOuv7LseRvDL7w'
		consumer_secret = 'hf9Ry3bdpdGt0f3QuUDNL6QV8hM'
		token = 'vNH1-dM7f8ebU1hWORteNrsq4HFOPEUK'
		token_secret = '4B-JCC-kp0jAFjZXJUwThs_vqn4'

		api_host = 'api.yelp.com'
		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		path = "/v2/search?term=#{session[:name]}&location=#{session[:zip_code].to_s}&limit=1"
    hash = JSON.parse(access_token.get(path).body)

    @location = hash["businesses"][0]["location"]["city"]
    @name = hash["businesses"][0]["name"]
    @phone_number = hash["businesses"][0]["phone"]
    @image = hash["businesses"][0]["image_url"]
    @address = hash["businesses"][0]["location"]["address"]
    @zip_code = hash["businesses"][0]["location"]["postal_code"]
    @state = hash["businesses"][0]["location"]["state_code"]
  end
end
