class Badge < ApplicationRecord
  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges
  belongs_to :badge_rule

  validates :title, presence: true, uniqueness: true

  before_save :default_image

  IMAGES = [
    ['First try success', '1st_success.png'],
    ['Leader', 'leader.png'],
    ['Complete category', 'winner_category.png'],
    ['Complete level', 'winner_level.png'],
  ].freeze

  private

  def default_image
    self.image = 'default_badge.png' if self.image.empty?
  end
end
