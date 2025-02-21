require "net/http"
require "json"

class ImportDriversJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform
    url = URI.parse("https://api.openf1.org/v1/drivers")
    response = Net::HTTP.get_response(url)

    return unless response.is_a?(Net::HTTPSuccess)

    drivers = JSON.parse(response.body)

    drivers.each do |driver_data|
      Driver.find_or_create_by(driver_id: driver_data["driver_number"]) do |driver|
        driver.first_name = driver_data["first_name"]
        driver.last_name  = driver_data["last_name"]
        driver.car_number = driver_data["driver_number"]
        driver.team       = driver_data["team_name"]
      end
    end

    Rails.logger.info "Drivers imported successfully from OpenF1!"
  end
end
