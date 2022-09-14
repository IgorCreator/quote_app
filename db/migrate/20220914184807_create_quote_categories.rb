class CreateQuoteCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :quote_categories do |t|
      t.integer :quote_id
      t.integer :category_id
    end
  end
end
