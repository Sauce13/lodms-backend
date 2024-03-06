class AddDepartmentIdToDepartmentLevelLearningOutcome < ActiveRecord::Migration[7.1]
  def change
    add_reference :department_level_learning_outcomes, :department, null: false, foreign_key: true
  end
end
