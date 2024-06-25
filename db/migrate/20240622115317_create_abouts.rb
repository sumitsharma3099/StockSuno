class CreateAbouts < ActiveRecord::Migration[7.1]
  def change
    create_table :abouts do |t|
      t.text :content
      t.string :image_link

      t.timestamps
    end
  end
end
