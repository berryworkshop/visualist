class InitialSetup < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :type
      t.string :slug
      t.string :title
      t.text :body
      t.jsonb :properties

      t.timestamps
    end

    create_table :edges do |t|
      t.references :subject, class_name: 'Node'
      t.string :predicate
      t.references :dobject, class_name: 'Node'
      t.jsonb :properties

      t.timestamps
    end
  end
end
