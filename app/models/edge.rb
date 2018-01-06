class Edge < ApplicationRecord
  belongs_to :subject, foreign_key: "subject_id", class_name: "Node"
  belongs_to :dobject, foreign_key: "dobject_id", class_name: "Node"

end

# node == follower == subject
# edge == followee == dobject
