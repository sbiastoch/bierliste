# Load the Rails application.
require File.expand_path('../application', __FILE__)

class Numeric
  def euro
    "%.2f€" % self
  end
end

# Initialize the Rails application.
SampleApp::Application.initialize!

