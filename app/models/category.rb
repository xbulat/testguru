class Category < ApplicationRecord
  has_many :test, dependent: :nullify
  default_scope { order(title: :asc) }

  validates :title, presence: true, uniqueness: true
end
