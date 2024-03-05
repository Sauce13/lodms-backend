class DepartmentLevelLearningOutcome < ApplicationRecord
  belongs_to :department
  has_many :performance_indicators
end
