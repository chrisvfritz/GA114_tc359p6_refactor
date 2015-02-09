require 'sinatra'
require 'json'
require 'holidapi'
require 'iso_country_codes'

class MyWebApp < Sinatra::Base
  get '/' do
    @birth_month = Date.new(1993,1)
    @curr_month  = Date.today
    @country     = 'us'
    @hApi_curr   = HolidApi.get
    @hApi_birth  = HolidApi.get(country:"#{@country}", year:"#{@birth_month.year}",
                               month:"#{@birth_month.month}")
    erb :index
  end
end

