class User < ApplicationRecord
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests

  def passed_by_level(level)
    tests.where(level: level)
  end
end
