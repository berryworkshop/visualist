class Event < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user

  has_many :vectors_out,
    foreign_key: :subject_id,
    class_name: "Vector",
    dependent: :destroy

  has_many :vectors_in,
    foreign_key: :dobject_id,
    class_name: "Vector",
    dependent: :destroy

  # has_many :subjects, through: :vectors_incoming, source: :subject
  # has_many :events, through: :vectors_out, source: :dobject, source_type: 'Event'

  # has_many :subject_connections, as: :subject
  # has_many :dobject_connections, as: :dobject
end
