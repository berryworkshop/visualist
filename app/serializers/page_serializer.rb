class PageSerializer < NodeSerializer
  set_type :page
  attributes :slug, :title, :body, :properties
end
