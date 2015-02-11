require 'iso_country_codes'

module HolidayListing
  class Country

    def initialize(country_code)
      @country_code = country_code || 'US'
    end

    def code
      @country_code
    end

    def name
      IsoCountryCodes.find(@country_code).name
    end

  end
end