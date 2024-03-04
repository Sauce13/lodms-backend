class User < ApplicationRecord
  has_many :students
  has_many :instructors
  has_many :program_admins
end
