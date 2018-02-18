class Record < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user

  has_many :associations_out,
    as: :subject,
    dependent: :destroy

  has_many :associations_in,
    as: :dobject,
    dependent: :destroy

  has_many :records_out,
    source_type: 'Record',
    through: :associations,
    source: :dobject

  has_many :redords_in,
    source_type: 'Record',
    through: :associations,
    source: :subject

end
