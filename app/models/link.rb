class Link < ActiveRecord::Base
  validates :title, :url, presence: true
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id
  )
  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :link_id
  )
end
