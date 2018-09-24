class Test < ApplicationRecord
  belongs_to :category

  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.test_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
