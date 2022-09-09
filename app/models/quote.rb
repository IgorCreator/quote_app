class Quote < ApplicationRecord
  belongs_to :author
  validates :content, presence: true, length: { minimum: 6, maximum: 2000 }
end
