class CoursePerformanceIndicator < ApplicationRecord
  belongs_to :course
  belongs_to :performance_indicator
end
