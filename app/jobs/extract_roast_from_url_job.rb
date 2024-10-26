require "selenium-webdriver"
require "sanitize"

class ExtractRoastFromUrlJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform(*args)
    id, url, user_id = args
    Rails.logger.info("Extracting roast from URL: #{url}")

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless") # Run in headless mode
    driver = Selenium::WebDriver.for :chrome, options: options

    begin
      driver.get url

      # Wait for the page to finish rendering async components
      wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
      wait.until { driver.execute_script("return document.readyState") == "complete" }

      # Extract the body content
      body_content = driver.find_element(tag_name: "body").attribute("innerHTML")

      filtered_content = Sanitize.fragment(body_content, Sanitize::Config::BASIC)

      Rails.logger.info("Extracted Markdown content: #{filtered_content}")
    ensure
      driver.quit
    end
  end
end
