class AddAuthorUniqunessCol < ActiveRecord::Migration[6.1]
  def change
    add_index :authors, [:first_name, :last_name], unique: true
  end
end
