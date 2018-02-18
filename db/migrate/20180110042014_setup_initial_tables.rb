class SetupInitialTables < ActiveRecord::Migration[5.1]
  def change

    create_table :records do |t|
      t.string :type
      t.string :name
      t.text :body
      t.belongs_to :user
      t.string :properties, json: true
      t.timestamps
    end

    create_table :associations do |t|
      t.belongs_to :subject, class_name: 'Record'
      t.string :predicate
      t.belongs_to :dobject, class_name: 'Record'
      t.string :properties, json: true
      t.timestamps
    end

    create_table :media do |t|
      t.string :mime_type
      t.string :checksum
      t.string :url
      t.belongs_to :mediable, polymorphic: true
      t.string :properties, json: true
      t.timestamps
    end

    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.belongs_to :ownable, polymorphic: true
      t.string :properties, json: true
      t.timestamps
    end

    create_table :tags do |t|
      t.belongs_to :parent, default: 0
      t.string :term
      t.string :vocabulary, default: 'visualist'
      t.belongs_to :taggable, polymorphic: true
      t.string :properties, json: true
      t.timestamps
    end

    create_table :locations do |t|
      t.decimal :latitude, precision: 8, scale: 5
      t.decimal :longitude, precision: 8, scale: 5
      t.text :address
      t.belongs_to :locatable, polymorphic: true
      t.string :properties, json: true
      t.timestamps
    end

    create_table :periods do |t|
      t.datetime :start
      t.string   :start_precision
      t.datetime :end
      t.string   :end_precision
      t.belongs_to :timeable, polymorphic: true
      t.string :properties, json: true
      t.timestamps
    end

    create_table :emails do |t|
      t.string :address
      t.belongs_to :record
      t.string :properties, json: true
      t.timestamps
    end

    create_table :phones do |t|
      t.string :number
      t.belongs_to :record
      t.string :properties, json: true
      t.timestamps
    end

    create_table :socials do |t|
      t.string :account
      t.string :system
      t.belongs_to :record
      t.string :properties, json: true
      t.timestamps
    end

    create_table :websites do |t|
      t.string :url
      t.belongs_to :record
      t.string :properties, json: true
      t.timestamps
    end

  end
end

