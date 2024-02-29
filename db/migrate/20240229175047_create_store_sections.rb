class CreateStoreSections < ActiveRecord::Migration[7.1]
  def change
    create_table :store_sections do |t|
      t.string :name, limit: 64

      t.timestamps
    end
    add_index :store_sections, :name, unique: true
  end
end
