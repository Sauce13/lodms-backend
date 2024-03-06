class AddDepartmentLevelLearningOutcomeIdToPerformanceIndicators < ActiveRecord::Migration[7.1]
  def change
    add_reference :performance_indicators, :department_level_learning_outcome, null: false, foreign_key: true
  end
end
