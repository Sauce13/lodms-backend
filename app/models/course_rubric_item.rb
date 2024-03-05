class CourseRubricItem < ApplicationRecord
  has_and_belongs_to_many :assignments
  has_and_belongs_to_many :course_performance_indicators
end
