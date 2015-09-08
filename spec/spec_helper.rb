require 'rubygems'
require 'spork'
require 'pry'
require 'database_cleaner'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  #require 'rspec/autorun'

  #https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  #Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  # moved to guardfile. ~Joel
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"
    config.alias_example_to :the
    config.include FactoryGirl::Syntax::Methods

    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
    
    #http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/
    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    def authenticate(user, password = nil)
      visit login_path
      within("form") do
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => password
      end
      click_button 'Sign in'
    end
    def logout
      visit logout_path
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  # Hack to ensure models get reloaded by Spork - remove as soon as this is fixed in Spork.
  # Silence warnings to avoid all the 'warning: already initialized constant' messages that
  # appear for constants defined in the models.
  silence_warnings do
    Dir["#{Rails.root}/app/models/**/*.rb"].each {|f| load f}
    Dir["#{Rails.root}/app/services/**/*.rb"].each {|f| load f}
    Dir["#{Rails.root}/app/controllers/**/*.rb"].each {|f| load f}
    Dir["#{Rails.root}/app/mailers/**/*.rb"].each {|f| load f}
    Dir["#{Rails.root}/app/helpers/**/*.rb"].each {|f| load f}
    Dir["#{Rails.root}/app/forms/**/*.rb"].each {|f| load f}    
  end
end