class Category < ApplicationRecord
  before_save { self.name.downcase! }

  has_many :quote_categories
  has_many :quotes, through: :quote_categories

  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
end
