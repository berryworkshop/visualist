class PageSerializer < NodeSerializer
  set_type :page
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
