class Quote < ApplicationRecord
  belongs_to :author
  has_many :quote_categories
  has_many :categories, through: :quote_categories

  validates :content, presence: true, length: { minimum: 6, maximum: 2000 }
end
