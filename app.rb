require 'sinatra'
require 'json'
require 'holidapi'
require 'iso_country_codes'
require 'slim'

class MyWebApp < Sinatra::Base
  # These are global constants because they will never
  # change and may be used by other endpoints as well
  COUNTRY_OF_BIRTH = 'us'
  CURRENT_DATE = Date.today
  BIRTH_DATE   = Date.new(1993, 1, 1)
  # May as well specify the exact day as well, just in
  # case we need it for a future feature

  get '/' do
    # Since who knows when you'll next be looking at this
    # code, or if someone else may need to look at it,
    # it's better to have more verbose variable names,
    # explaining exactly what it is. Underscores are also
    # standard in Ruby over camelCase for variable names.

    # I also spread the variables out on multiple lines to
    # make them easier to read.

    @holidays_of_current_month_and_year = HolidApi.get(
      year:  CURRENT_DATE.year,
      month: CURRENT_DATE.month
    )

    @holidays_of_birth_year = HolidApi.get(
      country: COUNTRY_OF_BIRTH,
      year:    BIRTH_DATE.year,
      month:   BIRTH_DATE.month
    )

    slim :index
  end

  helpers do

    # "Helper" methods are great for formatting data we might want available
    # in all of our views. They tend to be more concerned with how things
    # look, rather than the actual data

    def current_date
      CURRENT_DATE.strftime('%B %Y')
    end

    def birth_date
      BIRTH_DATE.strftime('%B %Y')
    end

    def birth_country_name
      IsoCountryCodes.find(COUNTRY_OF_BIRTH).name
    end

  end
end
