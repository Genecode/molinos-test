class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
