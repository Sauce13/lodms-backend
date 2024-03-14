class Course < ApplicationRecord
    has_many :course_students
    has_many :students, through: :course_students
    has_many :course_performance_indicators
    has_many :performance_indicators, through: :course_performance_indicators
  end
  