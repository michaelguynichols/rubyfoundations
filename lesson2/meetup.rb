require 'date'
NUM_DAYS_IN_MONTH = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
                      7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
DAYS = { monday: 'Monday', tuesday: 'Tuesday', wednesday: 'Wednesday',
         thursday: 'Thursday', friday: 'Friday', saturday: 'Saturday',
         sunday: 'Sunday' }
SCHEDULE = { first: 0, second: 1, third: 2, fourth: 3,
             last: -1 }
             
# Define a class Meetup with a constructor taking a montth and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.
# rubocop:disable Style/AlignParameters
class Meetup
  attr_accessor :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    dates = find_day_indices(DAYS[day])
    if schedule == :teenth
      Date.new(year, month, teenth(dates))
    else
      Date.new(year, month, dates[SCHEDULE[schedule]])
    end
  end

  def find_day_indices(day)
    day_dates = []
    (1..NUM_DAYS_IN_MONTH[month]).each do |d|
      check = Date.new(year, month, d).strftime('%A')
      if check == day
        day_dates << d
      end
    end
    day_dates
  end

  def teenth(day_indices)
    day_indices.each do |date|
      if (13..19).cover?(date)
        return date
      end
    end
  end
end

puts Meetup.new(3, 2013).day(:monday, :first)
