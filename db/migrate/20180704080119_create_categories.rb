class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true, unique: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
