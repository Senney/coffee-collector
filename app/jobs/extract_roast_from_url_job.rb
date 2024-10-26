class ExtractRoastFromUrlJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform(*args)
    id, url, user_id = args
    Rails.logger().info("Extracting roast from URL: #{url}")
  end
end
