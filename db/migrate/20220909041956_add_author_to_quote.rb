class AddAuthorToQuote < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :author_id, :integer
  end
end
