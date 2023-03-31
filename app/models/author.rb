class Author < ApplicationRecord
  before_save do
    normalized_name =  Nameable.parse(
      [prefix, first_name, middle_name, last_name].join(' ') + (suffix ? ", #{suffix}" : '')
    )
    self.first_name = normalized_name.to_firstname
    self.middle_name = normalized_name.to_middlename if normalized_name.middle != nil
    self.last_name = normalized_name.to_lastname if normalized_name.last != nil
    self.prefix = normalized_name.to_prefix if normalized_name.prefix != nil
    self.suffix = normalized_name.to_suffix if normalized_name.suffix != nil
  end

  has_many :quotes, dependent: :destroy

  validates :first_name, presence: true
  validates_uniqueness_of :first_name,
                          :scope => :last_name,
                          :message => "and Last name already exist"

  def full_name
    [prefix, first_name, middle_name, last_name].join(' ') + (suffix ? ", #{suffix}" : '')
  end

  def self.create_or_find_by_full_name(full_name)
    parsed_name = Nameable.parse(full_name)
    self.create_or_find_by(
      prefix: parsed_name.prefix,
      first_name: parsed_name.first,
      middle_name: parsed_name.middle,
      last_name: parsed_name.last,
      suffix: parsed_name.suffix
    )
  end
end
