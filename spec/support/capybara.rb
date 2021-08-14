require 'capybara'
require 'selenium-webdriver'

Capybara.configure do |config|
end

Capybara.register_driver :remote_chrome do |app|
  args = %w[
    no-sandbox
    window-size=1680,1050
  ]
  headless = ActiveModel::Type::Boolean.new.cast(ENV.fetch('SELENIUM_HEADLESS') { true })
  args += %w[headless disable-gpu] if headless

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => args
    }
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: ENV['SELENIUM_HUB_URL'],
    capabilities: caps
  )
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.app_host = "http://#{Capybara.server_host}"
    driven_by :remote_chrome
  end
end
