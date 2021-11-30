class User < ApplicationRecord
  validates_uniqueness_of :email
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
end
