class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: 'Test'
  has_many :gists
  has_many :feedbacks

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

  def display_name
    first_name.capitalize
  end

  def guru?
    self.is_a? User
  end

  def admin?
    self.is_a? Admin
  end
end
