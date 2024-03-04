class CreateCoursePerformanceIndicators < ActiveRecord::Migration[7.1]
  def change
    create_table :course_performance_indicators do |t|
      t.references :course, null: false, foreign_key: true
      t.references :performance_indicator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
