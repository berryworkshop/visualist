class CreateEvent < Neo4j::Migrations::Base
  def up
    add_constraint :Event, :uuid
  end

  def down
    drop_constraint :Event, :uuid
  end
end
