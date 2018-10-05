class Category < ApplicationRecord
  has_many :test, dependent: :nullify
end
