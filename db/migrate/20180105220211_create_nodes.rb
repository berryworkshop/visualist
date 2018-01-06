class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|

      t.timestamps
    end
  end
end
