class Author < ApplicationRecord
  before_save do
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize if self.last_name
  end

  has_many :quotes
  validates :first_name, presence: true

  validates_uniqueness_of :first_name,
                          :scope => :last_name,
                          :message => "and Last name already exist"

  def full_name
    [first_name, last_name].join(' ')
  end
end
