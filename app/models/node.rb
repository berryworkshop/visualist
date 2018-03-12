require "json"

class Node < ApplicationRecord
  # JSON_SCHEMA = "#{Rails.root}/app/models/schemas/node.json"

  attr_accessor :properties_schema
  @properties_json_schema = {
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
  validates :properties, json: { schema: @properties_json_schema.to_json }

  # has_many :edges_out,
  #   class_name: 'Edge',
  #   foreign_key: :subject_id,
  #   dependent: :destroy

  # has_many :edges_in,
  #   class_name: 'Edge',
  #   foreign_key: :dobject_id,
  #   dependent: :destroy

  # has_many :nodes_out,
  #   through: :edges_out,
  #   source: :dobject

  # has_many :nodes_in,
  #   through: :edges_in,
  #   source: :subject
end
