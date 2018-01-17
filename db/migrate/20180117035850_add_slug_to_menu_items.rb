class AddSlugToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :slug, :string
  end
end
