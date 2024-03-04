class ProgramAdmin < ApplicationRecord
  has_one :department
  belongs_to :user
end
