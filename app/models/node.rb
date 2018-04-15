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

  has_many :dobject_relations,
    class_name: 'Edge',
    foreign_key: :subject_id,
    dependent: :destroy

  has_many :subject_relations,
    class_name: 'Edge',
    foreign_key: :dobject_id,
    dependent: :destroy

  has_many :dobjects,
    through: :dobject_relations,
    source: :dobject

  has_many :subjects,
    through: :subject_relations,
    source: :subject
end
