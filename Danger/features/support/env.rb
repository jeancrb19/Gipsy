require 'rspec'
require 'capybara/cucumber'
require 'pry'
require 'yaml'
require 'capybara/poltergeist'

if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
elsif ENV['chrome_headless']
  Capybara.default_driver = :chrome_headless
  Capybara.register_driver :chrome_headless do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, switches: ['--headless', '--no-sandbox', '--disable-gpu', '--window-size=1920,1080'])
end
elsif ENV['firefox']
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
elsif ENV['ie']
  Capybara.default_driver = :ie
  Capybara.register_driver :ie do |app|
    Capybara::Selenium::Driver.new(app, browser: :internet_explorer)
  end
elsif ENV['headless_debug']
  Capybara.default_driver = :poltergeist_debug
  Capybara.register_driver :poltergeist_debug do |app|
    Capybara::Poltergeist::Driver.new(app, inspector: true)
  end
  Capybara.javascript_driver = :poltergeist_debug
elsif ENV['headless']
  Capybara.javascript_driver = :poltergeist
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
end
