class ContactShare < ApplicationRecord
  validates :contact_id, uniqueness: {scope: :user_id}
  validates :contact_id, :user_id, presence: true

  belongs_to(
    :contact,
    class_name: "Contact",
    foreign_key: :contact_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  
end
