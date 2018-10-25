class User < ApplicationRecord
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: 'Test'

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+@.+\..+/i }

  def passed_by_level(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(created_at: :desc ).find_by(test: test)
  end
end
