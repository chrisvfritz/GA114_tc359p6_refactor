require 'holidapi'
require 'json'

require_relative 'holiday'
require_relative 'country'

module HolidayListing
  class Fetcher
    CURRENT_DATE = Date.today

    attr_reader :country

    def initialize(options)
      @country = HolidayListing::Country.new options[:country_code]
      @year    = options[:year] || CURRENT_DATE.year
      @month   = options[:month]
      @day     = options[:day]
    end

    def date
      @date ||= lambda do
        return Date.new(@year, @month, @day) if @year && @month && @day
        return Date.new(@year, @month)       if @year && @month
        return Date.new(@year)               if @year
      end.call

      @date.strftime '%B %Y'
    end

    def holidays
      @holidays ||= HolidApi.get({
        country: @country.code,
        year:    @year,
        month:   @month,
        day:     @day
      }.delete_if { |key, value| value.nil? })

      return [] unless @holidays.any?

      @holidays.flatten.map do |holiday_data|
        HolidayListing::Holiday.new holiday_data
      end
    end

  end
end