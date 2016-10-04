class Contact < ApplicationRecord
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id
  )

  has_many(
    :shared_users,
    through: :contact_shares,
    source: :user
  )

end
