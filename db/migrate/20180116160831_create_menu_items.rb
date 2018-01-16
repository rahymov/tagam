class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :category_id

      t.timestamps
    end
  end
end
