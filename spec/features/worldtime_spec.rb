RSpec.describe 'Checking worldtimeapi', :vcr, js: true do
  curl "http://worldtimeapi.org/api/timezone/Europe/Kiev"
end