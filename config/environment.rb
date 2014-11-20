# Load the Rails application.
require File.expand_path('../application', __FILE__)

class Numeric
  def euro
    "%.2f€" % self
  end
end

class Time
  def weekdays
    days_total = Time.days_in_month(self.month, self.year)
    days = (1..days_total)
    days = days.map { |d| Date.new(self.year, self.month, d) }
    days.reject do |d|
      d.saturday? or d.sunday?
    end
  end
end



# Initialize the Rails application.
SampleApp::Application.initialize!

