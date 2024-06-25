class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :new_from
      t.string :image_link

      t.timestamps
    end
  end
end
