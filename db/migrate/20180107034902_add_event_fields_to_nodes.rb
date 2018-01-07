class AddEventFieldsToNodes < ActiveRecord::Migration[5.1]
  def change
    add_column :nodes, :name, :string
    add_column :nodes, :status, :boolean
  end
end
