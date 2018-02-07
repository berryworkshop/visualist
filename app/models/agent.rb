class Agent < ApplicationRecord
  validates :name, :body, :user, presence: true

  has_many :associations_out,
    as: :subject,
    dependent: :destroy

  has_many :associations_in,
    as: :dobject,
    dependent: :destroy

  has_many :agents_out,
    source_type: 'Agent',
    through: :associations,
    source: :dobject

  has_many :agents_in,
    source_type: 'Agent',
    through: :associations,
    source: :subject

  belongs_to :user
end
