class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :image
      t.string :active

      t.timestamps
    end
  end
end
