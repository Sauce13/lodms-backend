class Department < ApplicationRecord
    has_many :instructors
    has_many :program_admins
    has_many :department_level_learning_outcomes
end
