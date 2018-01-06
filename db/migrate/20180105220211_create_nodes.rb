class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.string :type
      t.text :body
      t.text :categories, array: true, default: []
      t.belongs_to :user
      t.boolean :is_active
      t.boolean :is_approved
      t.boolean :is_featured, default: false
      t.boolean :is_public, default: true

      t.timestamps
      t.index :type
      t.index :categories
    end
  end
end
