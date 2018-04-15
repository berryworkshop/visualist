require "json"

class Node < ApplicationRecord
  # JSON_SCHEMA = "#{Rails.root}/app/models/schemas/node.json"
  alias_attribute :label, :type

  @schema = {
    #"$schema": "http://json-schema.org/draft-04/schema",
    type: "object",
    properties: {
      websites: {
        type: "array",
        items: {
          type: "object",
          properties: {
            url: {
              type: "string"
            }
          },
          required: [ "url" ],
          additionalProperties: false
        }
      }
    }
  }

  validates :slug, :title, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates :properties, json: {schema: @schema.as_json }

  has_many :edges,
    class_name: 'Edge',
    foreign_key: :subject_id,
    dependent: :destroy

  has_many :edges_inverted,
    class_name: 'Edge',
    foreign_key: :dobject_id,
    dependent: :destroy

  has_many :nodes,
    through: :edges,
    source: :dobject

  has_many :nodes_inverted,
    through: :edges_inverted,
    source: :subject

  def absolute_url
    return self.node_path self.id
  end
end
