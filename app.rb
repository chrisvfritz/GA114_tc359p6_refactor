require 'sinatra'
require 'slim'

require_relative 'lib/holiday_fetcher'

class HolidayListingApp < Sinatra::Base
  COUNTRY_OF_BIRTH = 'us'
  CURRENT_DATE = Date.today
  BIRTH_DATE   = Date.new(1993, 1, 1)

  get '/' do
    @holiday_groups = [
      # Holidays for current year and month
      HolidayListing::Fetcher.new(
        year:  CURRENT_DATE.year,
        month: CURRENT_DATE.month
      ),
      # Holidays for country, year, and month of birth
      HolidayListing::Fetcher.new(
        country: COUNTRY_OF_BIRTH,
        year:    BIRTH_DATE.year,
        month:   BIRTH_DATE.month
      )
    ]

    slim :index
  end
end
