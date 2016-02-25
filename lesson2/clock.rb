class Time
  def initialize(hours, minutes)
    @total_minutes = hours * 60 + minutes
  end

  def +(minutes)
    @total_minutes += minutes
    convert_to_time
  end

  def -(minutes)
    @total_minutes -= minutes
    convert_to_time
  end

  def ==(other_time)
    to_s == other_time.to_s
  end

  def convert_to_time
    wrap_clock
    hour_portion = @total_minutes/60
    minute_portion = @total_minutes % 60
    "#{add_leading_zero(hour_portion)}:#{add_leading_zero(minute_portion)}"
  end

  def wrap_clock
    if @total_minutes > (24 * 60)
      @total_minutes = @total_minutes % 60
    elsif @total_minutes < 0
      @total_minutes = @total_minutes + (24 * 60)
    end
  end

  def add_leading_zero(unit_of_time)
    unit_of_time < 10 ? "0" + unit_of_time.to_s : unit_of_time
  end

  def to_s
    convert_to_time
  end
end

class Clock
  def self.at(hours, minutes=0)
    @time = Time.new(hours, minutes)
  end
end
