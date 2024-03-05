class CreateDepartmentLevelLearningOutcomes < ActiveRecord::Migration[7.1]
  def change
    create_table :department_level_learning_outcomes do |t|
      t.text :outcome_description

      t.timestamps
    end
  end
end
