class AddCategoryToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :category, :string
  end
end
