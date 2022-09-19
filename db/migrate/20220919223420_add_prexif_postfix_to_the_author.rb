class AddPrexifPostfixToTheAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :prefix, :string
    add_column :authors, :suffix, :string
  end
end
