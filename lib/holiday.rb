require 'date'

require_relative 'country'

module HolidayListing
  class Holiday

    attr_reader :country, :name

    def initialize(holiday_data)
      @country = HolidayListing::Country.new holiday_data['country']
      @date    = Date.parse holiday_data['date']
      @name    = holiday_data['name']
    end

    def date
      @date.strftime '%B %-d, %Y'
    end

  end
end