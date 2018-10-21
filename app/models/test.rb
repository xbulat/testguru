class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests
  has_many :questions, dependent: :destroy

  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :by_level, ->(level) { where(level: level) }
  scope :sorted_by_title, -> { order(title: :desc) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'must be uniqueness title and level' }
  validates :level, presence: true,
                    numericality: { only_integer: true }

  def self.title_from_category(category)
    by_category(category).sorted_by_title.pluck(:title)
  end
end
