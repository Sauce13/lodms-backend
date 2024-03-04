class Instructor < ApplicationRecord
  has_many :course_instructors
  has_many :courses, through: :course_instructors
  belongs_to :department
  belongs_to :user
end
