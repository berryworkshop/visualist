require "json"

class PropertiesValidator < ActiveModel::Validator

  def valid_json?(json)
    # short circuit for nil
    if json == nil
      return false
    end

    if JSON.parse(json)
      return true
    end
    return false

    rescue JSON::ParserError => e
      return false
  end

  def validate(record)
    unless valid_json?(record.properties)
      record.errors[:base] << "node properties are not valid json"
    end
  end
end

class Node < ApplicationRecord
  validates :slug, :title, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates_with PropertiesValidator


  # validates_each :properties do |record, attr, value|
  #   record.errors.add(attr, 'must be valid json') unless JSON.parse value
  # end

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
