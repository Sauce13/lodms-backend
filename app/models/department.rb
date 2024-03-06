class Department < ApplicationRecord
    has_many :instructors
    has_many :program_admins
end
