class PerformanceIndicator < ApplicationRecord
  belongs_to :department_level_learning_outcome
  has_many :students
  has_many :program_level_rubric_items
  has_many :course_performance_indicators
end
