class Question < ApplicationRecord
  has_one :test
  has_one :answer
end
