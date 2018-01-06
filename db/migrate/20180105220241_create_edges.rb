class CreateEdges < ActiveRecord::Migration[5.1]
  def change
    create_table :edges do |t|
      t.timestamps
      t.references :subject, class_name: 'Node'
      t.string :predicate
      t.references :dobject, class_name: 'Node'
      t.index [:subject_id, :predicate, :dobject_id], unique: true
    end
  end
end
