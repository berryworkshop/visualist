class EventResource < JSONAPI::Resource
  attributes :type, :body, :categories,
    :user_id, :is_active, :is_approved, :is_featured, :is_public
end
