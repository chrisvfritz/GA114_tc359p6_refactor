require 'sinatra'
require 'json'
require 'holidapi'
require 'iso_country_codes'
require 'slim'

class MyWebApp < Sinatra::Base
  get '/' do
    @birth_month = Date.new(1993,1)
    @curr_month  = Date.today
    @country     = 'us'
    @hApi_curr   = HolidApi.get(year:"#{@curr_month.year}", month:"#{@curr_month.month}")
    @hApi_birth  = HolidApi.get(country:"#{@country}", year:"#{@birth_month.year}",
                                month:"#{@birth_month.month}")
    slim :index
  end
end

