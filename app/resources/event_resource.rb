class EventResource < JSONAPI::Resource
  attributes :name, :body, :categories,
    :user_id, :is_active, :is_approved, :is_featured, :is_public, :status
end
