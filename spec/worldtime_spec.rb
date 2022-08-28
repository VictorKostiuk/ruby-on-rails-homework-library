# frozen_string_literal: true


RSpec.describe 'Checking worldtimeapi', :vcr, js: true do
  it 'should return current time' do
    response = Faraday.get('http://worldtimeapi.org/api/timezone/Europe/Kiev')

    expect( JSON.parse(response.body)['datetime'].to_datetime.to_fs(:db)).to eql(Time.now.to_fs(:db))
  end
end
