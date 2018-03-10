class PageSerializer < NodeSerializer
  set_type :page
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
