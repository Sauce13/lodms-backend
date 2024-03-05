class CoursePerformanceIndicator < ApplicationRecord
  belongs_to :course
  belongs_to :performance_indicator
  has_and_belongs_to_many :course_rubric_items
end
