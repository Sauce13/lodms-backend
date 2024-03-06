class PerformanceIndicator < ApplicationRecord
    has_many :course_performance_indicators
    has_many :performance_indicators, through: :course_performance_indicators
end
