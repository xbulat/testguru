class Badge < ApplicationRecord
  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges
  belongs_to :badge_rule

  validates :title, presence: true, uniqueness: true

  def self.images
    [
      ['First try success', '1st_success.png'],
      ['Leader', 'leader.png'],
      ['Complete category', 'winner_category.png'],
      ['Complete level', 'winner_level.png'],
    ]
  end
end
