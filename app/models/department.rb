class Department < ApplicationRecord
  has_many :instructors
  has_many :department_level_learning_outcomes
  has_one :program_admin
end
