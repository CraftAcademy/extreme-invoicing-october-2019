require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

Webdrivers::Chromedriver.required_version = 2.44
chrome_options = %w[headless
                    no-sandbox
                    disable-popup-blocking
                    disable-gpu
                    disable-infobars
                    disble-dev-shm-usage
                    auto-open-devtools-for-tabs]

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: chrome_options)

  Capybara::Selenium::Driver.new(
  app,
  browser: :chrome,
  options: options
  )
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome

World FactoryBot::Syntax::Methods

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }