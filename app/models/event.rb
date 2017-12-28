class Event
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name, type: String
  property :description, type: String
  property :start_date, type: DateTime

end
