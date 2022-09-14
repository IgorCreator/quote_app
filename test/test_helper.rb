ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Devise::Test::IntegrationHelpers

  def sing_in_as_user
    password = "123456"
    @new_user = User.create(email: "test@gmail.com", password: password)
    login(@new_user)
  end

  def login(user)
    sign_in(user)
  end

end
