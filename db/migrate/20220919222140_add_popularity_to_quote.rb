class AddPopularityToQuote < ActiveRecord::Migration[6.1]
  def change
    add_column :quotes, :popularity, :float, default: 0.0 , null: false
  end
end
