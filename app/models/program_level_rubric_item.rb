class ProgramLevelRubricItem < ApplicationRecord
  has_one :performance_indicator
  has_many :assignments
end
