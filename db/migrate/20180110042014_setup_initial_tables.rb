class SetupInitialTables < ActiveRecord::Migration[5.1]
  def change
    create_table :vectors, force: :cascade do |t|
      t.references :subject, polymorphic: true, index: true
      t.string :predicate
      t.references :dobject, polymorphic: true, index: true
      t.timestamps
    end

    create_table :contacts, force: :cascade do |t|
      t.references :contactable, polymorphic: true, index: true
      t.timestamps
    end

    def change
      create_join_table :contacts, :emails do |t|
        t.index [:contact_id, :email_id]
        t.index [:email_id, :contact_id]
      end
    end

    def change
      create_join_table :contacts, :phones do |t|
        t.index [:contact_id, :phone_id]
        t.index [:phone_id, :contact_id]
      end
    end

    def change
      create_join_table :contacts, :social_accounts do |t|
        t.index [:contact_id, :social_account_id]
        t.index [:social_account_id, :contact_id]
      end
    end

    create_table :emails, force: :cascade do |t|
      t.string :label
      t.string :value
      t.timestamps
    end

    create_table :events do |t|
      t.string :name
      t.text :body
      t.string :categories, array: true
      t.string :status
      t.references :user, index: true
      t.timestamps
    end

    create_table :flags, force: :cascade do |t|
      t.boolean :is_featured
      t.boolean :is_approved
      t.boolean :is_public
      t.references :flaggable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :images, force: :cascade do |t|
      t.string :name
      t.string :caption
      t.string :url
      t.string :aspect
      t.string :checksum
      t.references :citation, index: true
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :licenses, force: :cascade do |t|
      t.string :name
      t.string :url
      t.references :licenseable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :locations, force: :cascade do |t|
      t.decimal :latitude, precision: 8, scale: 5
      t.decimal :longitude, precision: 8, scale: 5
      t.string :street
      t.string :locality
      t.references :region, class_name: 'Term', index: true
      t.references :country, class_name: 'Term', index: true
      t.string :postal_code
      t.timestamps
      t.references :locatable, polymorphic: true, index: true
      t.index [:latitude], name: :index_locations_on_latitude
      t.index [:longitude], name: :index_locations_on_longitude
    end

    create_table :pages, force: :cascade do |t|
      t.string :name
      t.text :body
      t.string :categories, array: true
      t.references :parent, index: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :phones, force: :cascade do |t|
      t.string :label
      t.integer :country_code
      t.integer :area_code
      t.integer :exchange_code
      t.integer :number
      t.string :extension
      t.timestamps
    end

    create_table :websites, force: :cascade do |t|
      t.string :name
      t.string :url
      # t.references :websiteable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :organizations do |t|
      t.string :name
      t.text :body
      t.string :categories, array: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :people do |t|
      t.string :name
      t.string :name_given
      t.string :name_suffix
      t.text :body
      t.string :categories, array: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :places do |t|
      t.string :name
      t.text :body
      t.string :categories, array: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :snippets, force: :cascade do |t|
      t.string :value
      t.references :citation, index: true
      t.references :snippetable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :social_accounts, force: :cascade do |t|
      t.string :label
      t.string :service
      t.string :account
      # t.references :socialable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :citations, force: :cascade do |t|
      t.string :type
      t.string :title
      t.string :url
      # more for subclasses
      t.references :citeable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :terms, force: :cascade do |t|
      t.string :type
      t.string :value
      t.string :vocabulary
      t.string :remote_id
      t.string :remote_url
      t.timestamps
    end

    create_table :time_periods, force: :cascade do |t|
      t.datetime :start
      t.datetime :end
      t.integer :duration
      t.integer :precision
      t.timestamps
      t.references :timelineable, polymorphic: true, index: true
      t.index [:end], name: :index_time_periods_on_end
      t.index [:start], name: :index_time_periods_on_start
    end

    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.timestamps
    end

    create_table :works do |t|
      t.string :name
      t.text :body
      t.string :categories, array: true
      t.references :user, index: true
      t.timestamps
    end

  end
end

