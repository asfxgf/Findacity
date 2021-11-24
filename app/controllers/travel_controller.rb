class TravelController < ApplicationController
	def index
	end
	def search
   		city_information = find_weather(params[:city])
    	unless city_information
      		flash[:alert] = 'City not found'
      		return render action: :index
    	end
    	@city_information = city_information
    	@icon = "http://openweathermap.org/img/wn/#{@city_information["weather"][0]["icon"]}@2x.png"
  	end
end
private
  def request_api(url)
  	response = Excon.get(url)
=begin     	headers: {
      		'X-RapidAPI-Host' => URI.parse(url).host,
        	'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
	     	}
    	)
=end
    return nil if response.status != 200
    JSON.parse(response.body)
  end
  def find_weather(city)
    query = URI.encode("#{city}")
    request_api(
      "https://api.openweathermap.org/data/2.5/weather?q=#{query}&appid=#{ENV.fetch('OPEN_WEATHER_API_KEY')}"
    )
  end