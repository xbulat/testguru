class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :test, dependent: :nullify

  validates :title, presence: true, uniqueness: true
end
