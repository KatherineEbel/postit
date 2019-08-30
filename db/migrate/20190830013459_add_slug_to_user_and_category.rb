class AddSlugToUserAndCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slug, :string
    add_column :categories, :slug, :string
  end
end
