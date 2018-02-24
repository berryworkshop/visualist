class Node < ApplicationRecord
  has_many :edges_out,
    class_name: 'Edge',
    foreign_key: :subject_id,
    dependent: :destroy

  has_many :edges_in,
    class_name: 'Edge',
    foreign_key: :dobject_id,
    dependent: :destroy

  has_many :nodes_out,
    through: :edges_out,
    source: :dobject

  has_many :nodes_in,
    through: :edges_in,
    source: :subject
end
