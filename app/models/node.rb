class Node < ApplicationRecord
  has_many :edges_out,
    class_name: 'Edge',
    foreign_key: :subject,
    dependent: :destroy

  has_many :edges_in,
    class_name: 'Edge',
    foreign_key: :dobject,
    dependent: :destroy

  # has_many :nodes_out,
  #   through: :edges_out,
  #   source: 'Edge'


  # has_many :nodes_in,
  #   through: :edges_in,
  #   source: :subject
end
