class Node < ApplicationRecord
  has_many :edges_incoming, foreign_key: :dobject_id, class_name: "Edge"
  has_many :subjects, through: :edge_subjects, source: :subject

  has_many :edges_outgoing, foreign_key: :subject_id, class_name: "Edge"
  has_many :dobjects, through: :edge_dobjects, source: :dobject

end

# node == follower == subject
# edge == followee == dobject
