class User < ApplicationRecord
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: 'Test'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true,
                    uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def passed_by_level(level)
    tests.where(level: level)
  end
end
