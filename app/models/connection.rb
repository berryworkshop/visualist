class Connection < ApplicationRecord
  # belongs_to :subject, foreign_key: "subject_id", class_name: "Node"
  # belongs_to :dobject, foreign_key: "dobject_id", class_name: "Node"

  validates :subject, :predicate, :dobject, presence: true
  validates :predicate,
    inclusion: {
      message: "%{value} is not a valid predicate",
      in: [
        :has_affiliation,
        :has_contributor,
        :has_creator,
        :has_curator,
        :has_editor,
        :has_employee,
        :has_exhibitor,
        :has_friend,
        :has_member,
        :has_organizer,
        :has_owner,
        :has_parent,
        :has_performer,
        :has_place,
        :has_place_born,
        :has_place_died,
        :has_place_founded,
        :has_place_lived,
        :has_primary,
        :has_producer,
        :has_publisher,
        :has_representation_with,
        :has_spouse,
        :has_translator,
        :has_venue,
        :is_about,
        :is_part_of,
        :is_same_as,
      ].map { |x| x.to_s }
    }
end

# node == follower == subject
# edge == followee == dobject
