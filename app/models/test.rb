class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests
  has_many :question, dependent: :destroy

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :by_level, ->(level) { where(level: level) }
  scope :order_by_category, ->(category) { by_category.order(title: :desc) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true, uniqueness: { scope: :level,
                                    message: "must be uniqueness title and level"}
  validates :level, presence: true, numericality: { only_integer: true }
  
  def self.test_by_category(category)
    Test.order_by_category(category).pluck(:title)
  end
end
