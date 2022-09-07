class Quote < ApplicationRecord
  validates :content, presence: true, length: { minimum: 6, maximum: 2000 }
end
