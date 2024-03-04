class Assignment < ApplicationRecord
  has_and_belongs_to_many :course_rubric_items
  has_and_belongs_to_many :course_students
  belongs_to :course
  has_and_belongs_to_many :program_level_rubric_items
end
